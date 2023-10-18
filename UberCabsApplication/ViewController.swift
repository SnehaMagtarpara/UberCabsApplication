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

  
    @IBAction func getStartedbuttonAction(_ sender: Any) {
        navigation()
    }
    func navigation()
    {
    let navigation = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LogInPage
        navigationController?.pushViewController(navigation, animated: true)
        }
    
}

