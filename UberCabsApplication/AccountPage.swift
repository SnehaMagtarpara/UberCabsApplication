//
//  AccountPage.swift
//  UberCabsApplication
//
//  Created by R93 on 08/08/23.
//

import UIKit

class AccountPage: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var imagePicker: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        value()
        value2()

    }
   
    @IBAction func accountButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"AccountDetails") as! AccountDetails
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func settingButton(_ sender: Any) {
    }
    @IBAction func manageAccountPage(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"AccountDetails") as! AccountDetails
        navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func activityPage(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"ActivityPage") as! ActivityPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func legalButton(_ sender: Any) {
        
    }
    func value2 ()
    {
        firstNameLabel.text = MyLibrary2.share.firstName
        lastNameLabel.text = MyLibrary2.share.lastName
    
    }
    
    func value ()
    {
        firstNameLabel.text = MyLibrary.share.firstName
        lastNameLabel.text = MyLibrary.share.lastName
    }
}

