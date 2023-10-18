//
//  IntercityPage.swift
//  UberCabesProject
//
//  Created by R93 on 05/08/23.
//

import UIKit

class IntercityPage: UIViewController {

    @IBOutlet weak var getStartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartButton.layer.cornerRadius = 20
        tabBarItem.isEnabled = true
    }
   
    @IBAction func getStartedButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier:"ViewController3") as! ViewController3
        navigationController?.pushViewController(navigation, animated: true)
    }
     
}
