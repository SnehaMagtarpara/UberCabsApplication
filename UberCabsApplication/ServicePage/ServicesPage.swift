//
//  ServicesPage.swift
//  UberCabesProject
//
//  Created by R93 on 07/08/23.
//

import UIKit

class ServicesPage: UIViewController {
    
    @IBOutlet weak var promoLabel: UILabel!
    @IBOutlet weak var rideButton: UIButton!
    @IBOutlet weak var intercityButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        intercityButton.layer.cornerRadius = 5
        rideButton.layer.cornerRadius = 5
        promoLabel.layer.cornerRadius = 10
        promoLabel.layer.masksToBounds = true
       
    }
    
   
    @IBAction func rideButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"ViewController3") as! ViewController3
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func intercityButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"IntercityPage") as! IntercityPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    
}
