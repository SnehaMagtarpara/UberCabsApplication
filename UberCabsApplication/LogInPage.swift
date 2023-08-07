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
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var continueWithApple: UIButton!
    @IBOutlet weak var continueWithFacebook: UIButton!
    @IBOutlet weak var continueWithEmail: UIButton!
    @IBOutlet weak var continueWithGoogle: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        reference = Firestore.firestore()
        setProperty()
    }
    
    @IBAction func continueNumberButtonAction(_ sender: Any) {
        numberData()
    }
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueWithfacebookButtonAction(_ sender: Any) {
        facebookShowalert()
    }
    
    @IBAction func continueWithGoogleButtonAction(_ sender: Any) {
        googleShowalert()
    }
    
    @IBAction func continueWithEmailButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"EmailPage") as! EmailPage
        navigationController?.pushViewController(navigation, animated: true)
        
    }
    
    @IBAction func continueAppleButtonAction(_ sender: Any) {
        
        let navigation = storyboard?.instantiateViewController(withIdentifier:"ContinueWithApple" ) as! ContinueWithApple
        navigation.mynev = self.navigationController
        present(navigation, animated: true, completion: nil)
    }
    
    // MARK = FIRE Authenication
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
    
    // MARK = FireStore
    
    func addData()
    {
        reference.collection("Phone Number Data").document(numberTextField.text!).setData(["Number":numberTextField.text])
        
    }
    
    // MARK = Property Set Function
    
    func setProperty()
    {
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
        continueWithApple.layer.cornerRadius = 10
        continueWithApple.layer.masksToBounds = true
        continueWithFacebook.layer.cornerRadius = 10
        continueWithFacebook.layer.masksToBounds = true
        continueWithGoogle.layer.cornerRadius = 10
        continueWithGoogle.layer.masksToBounds = true
        continueWithEmail.layer.cornerRadius = 10
        continueWithEmail.layer.masksToBounds = true
        backButton.layer.cornerRadius = 26
        backButton.layer.masksToBounds = true
    }
    // MARK = ShowAlert in Facebook/Google
    
    func facebookShowalert()
    {
        let alert = UIAlertController(title: "Uber wants to open Facebook", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title:"Open", style: .default,handler: nil))
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
    
}

