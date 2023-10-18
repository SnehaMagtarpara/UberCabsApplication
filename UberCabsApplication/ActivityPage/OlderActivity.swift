//
//  OlderActivity.swift
//  UberCabsApplication
//
//  Created by R93 on 08/08/23.
//

import UIKit

class OlderActivity: UIViewController {

    var mynev : UINavigationController?

    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var popView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pastButton.layer.cornerRadius = 10
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            self.view.alpha = 1
        }
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)

    }
    
    
    @IBAction func psatButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier:"PastTripPage" ) as! PastTripPage
        mynev?.pushViewController(navigation, animated: true)
        present(navigation, animated: true)
//        dismiss(animated: false, completion: nil)
    }
    

}
