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
        emailDataSave()
        let navigation = storyboard?.instantiateViewController(identifier:"ContinuePasscodePage") as! ContinuePasscodePage
        navigationController?.popViewController(animated: true)
    }
    func emailDataSave()
    {
        Auth.auth().createUser(withEmail:emilaAddressTextField.text!, password:passwordTextField.text!){ [self]authDataResult,error in
            print(authDataResult,error?.localizedDescription)
            
            self.reference.collection("User").document((authDataResult?.user.uid)!).setData(["Email Addres":emilaAddressTextField.text!])
        }
        
        
    }
    
}
