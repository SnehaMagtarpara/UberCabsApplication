//
//  PastTripPage.swift
//  UberCabsApplication
//
//  Created by R93 on 08/08/23.
//

import UIKit

class PastTripPage: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.layer.cornerRadius = 20
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func getStartedButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier:"ViewController3") as! ViewController3
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
