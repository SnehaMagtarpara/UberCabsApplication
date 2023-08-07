//
//  HomePage.swift
//  UberCabesProject
//
//  Created by R93 on 05/08/23.
//

import UIKit

class HomePage: UIViewController {
    
    
    
    @IBOutlet weak var cv: UICollectionView!
    
    var imgArr = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3")]
    
    @IBOutlet weak var intercityButton: UIButton!
    @IBOutlet weak var rideButton: UIButton!
    
    @IBOutlet weak var promoLabel: UILabel!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intercityButton.layer.cornerRadius = 5
        rideButton.layer.cornerRadius = 5
        promoLabel.layer.cornerRadius = 10
        promoLabel.layer.masksToBounds = true
        
    }
    
    @IBAction func intercityButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier:"IntercityPage") as! IntercityPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func rideButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier:"RidePage") as! RidePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func seeallButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier:"ServicesPage") as! ServicesPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
extension HomePage:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.img.image = imgArr[indexPath.row]
          return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 344, height: 175)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
    }
    
}
