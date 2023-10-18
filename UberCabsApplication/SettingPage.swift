//
//  SettingPage.swift
//  UberCabsApplication
//
//  Created by R93 on 09/09/23.
//

import UIKit

class SettingPage: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func value ()
    {
        firstNameLabel.text = MyLibrary.share.firstName
        lastNameLabel.text = MyLibrary.share.lastName
        
    }
    
    
    @IBAction func privicyButtonAction(_ sender: UIButton) {
        
    }
    

    @IBAction func securityButtonAction(_ sender: UIButton) {
    }
    
}
