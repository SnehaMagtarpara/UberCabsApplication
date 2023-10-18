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
        if cardNumberTextField.text?.count ?? 0 != 12
        {
            showAlert()
        }
        else if cvvNumberTextField.text?.count ?? 0 != 3
        {
            showAlertCvv()
        }
        else{
            addData()
            let navigation = storyboard?.instantiateViewController(withIdentifier:"TabBar") as! TabBar
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
    //MARK = FireBase...
    func addData()
    {
        reference.collection("User").addDocument(data: ["Card Number":cardNumberTextField.text!,"Cvv":cvvNumberTextField.text!])
    }
    
    //MARK =  Show Alert Message...
    func showAlert()
    {
        let alert = UIAlertController(title: "Enter Card Number  ", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel))
        present(alert,animated:true,completion: nil)
        
    }
    func showAlertCvv()
    {
        let alert = UIAlertController(title: "Enter Cvv Number  ", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel))
        present(alert,animated:true,completion: nil)
        
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
