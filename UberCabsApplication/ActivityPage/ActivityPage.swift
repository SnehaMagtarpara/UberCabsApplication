//
//  ActivityPage.swift
//  UberCabesProject
//
//  Created by R93 on 07/08/23.
//

import UIKit

class ActivityPage: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func olderActivityButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier:"OlderActivity" ) as! OlderActivity
            navigation.mynev = self.navigationController
            present(navigation, animated: true, completion: nil)
    }
  
    
}
