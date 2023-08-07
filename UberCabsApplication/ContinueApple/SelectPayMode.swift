//
//  SelectPayMode.swift
//  UberCabesProject
//
//  Created by R93 on 04/08/23.
//

import UIKit

class SelectPayMode: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func creditButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "CreditCardpage") as! CreditCardpage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func doThislaterButtonAction(_ sender: UIButton) {
        
    }
}
