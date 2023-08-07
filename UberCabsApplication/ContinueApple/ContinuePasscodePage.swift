//
//  ContinuePasscodePage.swift
//  uberCabs
//
//  Created by R93 on 14/07/23.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ContinuePasscodePage: UIViewController {

    var ref: DatabaseReference!
    var reference : Firestore!
    
    @IBOutlet weak var firstNametextField: UITextField!
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var mobileNumbertextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNametextField.attributedPlaceholder = NSAttributedString(
            string: "Enter first name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        lastNametextField.attributedPlaceholder = NSAttributedString(
            string: "Enter last name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        mobileNumbertextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Mobile Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        ref = Database.database().reference()
        reference = Firestore.firestore()
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated:true)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier:"SelectPayMode") as! SelectPayMode
        navigationController?.pushViewController(navigation, animated: true)
        addData()
    }
    func setButton()
    {
        backButton.layer.cornerRadius = 30
        nextButton.layer.cornerRadius = 25
    }
    func addData()
    {
        reference.collection("User").addDocument(data: ["First Name":firstNametextField.text!,"Last Name":lastNametextField.text!,"Number":mobileNumbertextField.text!])
        
    }
}
