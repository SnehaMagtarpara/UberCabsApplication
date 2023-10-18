//
//  LogInPage.swift
//  uberCabs
//
//  Created by R93 on 13/07/23.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LogInPage: UIViewController {
    
    var ref: DatabaseReference!
    var reference : Firestore!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var continueWithNumberButton: UIButton!
    @IBOutlet weak var continueWithAppleButton: UIButton!
    @IBOutlet weak var ContinueWithFacebookButton: UIButton!
    @IBOutlet weak var continueWithGoogleButton: UIButton!
    @IBOutlet weak var continueWithEmailButton: UIButton!
    @IBOutlet weak var backButtonAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        reference = Firestore.firestore()
        setProperty()
    }
    
    @IBAction func continueWithNumberButtonAction(_ sender: Any) {
        if numberTextField.text?.count ?? 0 != 10
        {
            showAlertNumber()
        }
        else
        {
            numberData()
            addData()
        }
        
    }
    @IBAction func continueWithAppleButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier:"ContinueWithApple" ) as! ContinueWithApple
        navigation.mynev = self.navigationController
        present(navigation, animated: true, completion: nil)
    }
    @IBAction func continueWithFacebookButtonAction(_ sender: Any) {
        facebookShowalert()
    }
    @IBAction func continueWithGoogleButtonAction(_ sender: Any) {
        googleShowalert()
    }
    @IBAction func continueWithEmailButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"EmailPage") as! EmailPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    // MARK = FIRE Authenication(For Number)
    
    func numberData()
    {
        PhoneAuthProvider.provider().verifyPhoneNumber(numberTextField.text!, uiDelegate: nil) { [self] verificationID, errors in
            if errors == nil
            {
                print("Done")
                showAlert(id: verificationID!)
            }
            else
            {
                print(errors?.localizedDescription)
            }
        }
    }
    func showAlert(id:String)
    {
        let alert = UIAlertController(title: "OTP", message: "Enter Your OTP", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { _ in
            self.veriyOtp(token: id, otp: (alert.textFields?.first?.text)!)
            self.navigation()
            
        }))
        present(alert, animated: true)
    }
    func veriyOtp(token:String,otp:String)
    {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: token, verificationCode: otp)
        Auth.auth().signIn(with: credential) { authresult , error  in
            if error == nil
            {
                print("OK")
            }
            else
            {
                print(error?.localizedDescription)
            }
        }
    }
    func navigation()
    {
        let n = storyboard?.instantiateViewController(identifier: "InformationPage") as! InformationPage
        navigationController?.pushViewController(n, animated: true)
        
    }
    
    // MARK = FireStore (For Number)
    
    func addData()
    {
        reference.collection("User").addDocument(data: ["Number":numberTextField.text!])
        
    }
    
    // MARK = Property Set Function
    
    func setProperty()
    {
        continueWithNumberButton.layer.cornerRadius = 10
        continueWithNumberButton.layer.masksToBounds = true
        continueWithAppleButton.layer.cornerRadius = 10
        continueWithAppleButton.layer.masksToBounds = true
        ContinueWithFacebookButton.layer.cornerRadius = 10
        ContinueWithFacebookButton.layer.masksToBounds = true
        continueWithGoogleButton.layer.cornerRadius = 10
        continueWithGoogleButton.layer.masksToBounds = true
        continueWithEmailButton.layer.cornerRadius = 10
        continueWithEmailButton.layer.masksToBounds = true
        backButtonAction.layer.cornerRadius = 26
        backButtonAction.layer.masksToBounds = true
    }
    // MARK = ShowAlert in Facebook/Google
    
    func facebookShowalert()
    {
        let alert = UIAlertController(title: "Uber wants to open Facebook", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title:"Open", style: .default,handler: { _ in
            self.navigationFacebook()
        }))
        present(alert,animated:true,completion: nil)
    }
    func googleShowalert()
    {
        let alert = UIAlertController(title: "Uber wants to Use google.com to Sign In", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Continue", style: .default,handler: { _ in
            self.navigationGoogle()
        }))
        present(alert,animated:true,completion: nil)
    }
    
    func navigationGoogle()
    {
        let navigation = storyboard?.instantiateViewController(identifier: "GooglePage") as! GooglePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationFacebook()
    {
        let navigation = storyboard?.instantiateViewController(identifier: "ContinueWithFacebook") as! ContinueWithFacebook
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    //MARK = SHOWALERT IN NUMBERTEXTFIELD
    func showAlertNumber()
    {
        let alert = UIAlertController(title: "Enter Your Number", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel))
        present(alert,animated:true,completion: nil)
        
    }
}

