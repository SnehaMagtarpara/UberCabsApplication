//
//  CreditCardpage.swift
//  UberCabesProject
//
//  Created by R93 on 04/08/23.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class CreditCardpage: UIViewController {
    
    var ref: DatabaseReference!
    var reference : Firestore!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cvvNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardNumberTextField.layer.borderColor = UIColor.black.cgColor
        cardNumberTextField.layer.borderWidth = 2
        ref = Database.database().reference()
        reference = Firestore.firestore()
        cvvNumberTextField.attributedPlaceholder = NSAttributedString(
            string: "123",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if cvvNumberTextField.text?.count ?? 0 != 10
        {
            addData()
            let navigation = storyboard?.instantiateViewController(withIdentifier:"TabBar") as! TabBar
            navigationController?.pushViewController(navigation, animated: true)
        }
        else{
            
        }
    }
    func addData()
    {
        reference.collection("User").addDocument(data: ["Card Number":cardNumberTextField.text!,"Cvv":cvvNumberTextField.text!])
    }
}
extension CreditCardpage: UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
}
