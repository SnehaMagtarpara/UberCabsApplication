//
//  AccountDetails.swift
//  UberCabsApplication
//
//  Created by R93 on 04/09/23.
//

import UIKit

class MyLibrary2 {
    static var share = MyLibrary()
    var firstName : String?
    var lastName : String?
    var number : String?
}
class AccountDetails: UIViewController {
    
  
    
    @IBOutlet weak var firstNameTextFirld: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var imagePicker: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 20
        doneButton.layer.masksToBounds = true
         value()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"AccountPage") as! AccountPage
        MyLibrary.share.firstName = firstNameTextFirld.text
        MyLibrary.share.lastName = lastNameTextField.text
        MyLibrary.share.number = numberTextField.text
        navigationController?.popViewController(animated: true)
    }
    
  
    
    @IBAction func addImageButtonAction(_ sender: Any) {
        showAlert()
        
    }
    
    func value ()
    {
        firstNameTextFirld.text = MyLibrary.share.firstName
        lastNameTextField.text = MyLibrary.share.lastName
        numberTextField.text = MyLibrary.share.number
        emailTextField.text = MyEmail.share.email
    }
}

extension AccountDetails : UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
    func showAlert()
    {
        let alert = UIAlertController.init(title: "Add Profile Image", message: "'", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title:"Camera", style: .default))
        alert.addAction(UIAlertAction.init(title:"Gallery", style: .default,handler: { alert in
             
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true)
        }))
        present(alert, animated: true)
    }
}
