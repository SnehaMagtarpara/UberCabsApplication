//
//  EmailPage.swift
//  uberCabs
//
//  Created by R93 on 14/07/23.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class MyEmail {
    static var share = MyEmail()
    var email : String?
    
}

class EmailPage: UIViewController {
    
    var ref: DatabaseReference!
    var reference : Firestore!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emilaAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 26
        backButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 26
        nextButton.layer.masksToBounds = true
        ref = Database.database().reference()
        reference = Firestore.firestore()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"LogInPage") as! LogInPage
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        //        emailDataSave()
        if emilaAddressTextField.text == ""
        {
            showAlertMail()
        }
        else if passwordTextField.text == ""
        {
            showAlertPassword()
        }
        else{
            let navigation = storyboard?.instantiateViewController(identifier:"TabBar") as! TabBar
            MyEmail.share.email = emilaAddressTextField.text
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
    
    func showAlertMail()
    {
        let alert = UIAlertController(title: "Enter Your E-mail", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel))
        present(alert,animated:true,completion: nil)
        
    }
    func showAlertPassword()
    {
        let alert = UIAlertController(title: "Enter Your Password", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel))
        present(alert,animated:true,completion: nil)
        
    }
    //    func emailDataSave()
    //    {
    //        Auth.auth().createUser(withEmail:emilaAddressTextField.text!, password:passwordTextField.text!){ [self]authDataResult,error in
    //            print(authDataResult,error?.localizedDescription)
    //
    //            self.reference.collection("User").document((authDataResult?.user.uid)!).setData(["Email Addres":emilaAddressTextField.text!])
    //        }
}
