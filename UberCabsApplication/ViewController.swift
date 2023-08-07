//
//  ViewController.swift
//  UberCabsApplication
//
//  Created by R93 on 07/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func getStartButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "LogInPage") as! LogInPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}

