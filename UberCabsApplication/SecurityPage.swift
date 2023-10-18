//
//  SecurityPage.swift
//  UberCabsApplication
//
//  Created by R93 on 12/09/23.
//

import UIKit

class SecurityPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"SettingPage") as! SettingPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
