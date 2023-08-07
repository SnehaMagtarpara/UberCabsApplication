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
    }
   
    @IBAction func getStartedButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier:"RidePage") as! RidePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
