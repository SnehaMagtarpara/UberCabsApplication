//
//  ContinueWithApple.swift
//  uberCabs
//
//  Created by R93 on 14/07/23.
//

import UIKit

class ContinueWithApple: UIViewController {
    @IBOutlet weak var continuwWithPasscodeButton: UIButton!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var popView: UIView!
    
    var mynev : UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImg.layer.cornerRadius = 10
        popView.layer.cornerRadius = 10
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            self.view.alpha = 1
        }
    }
    
    @IBAction func cancleButtonAction(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func passcodeButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier:"ContinuePasscodePage" ) as! ContinuePasscodePage
        mynev?.pushViewController(navigation, animated: true)
        dismiss(animated: false, completion: nil)
    }
}
