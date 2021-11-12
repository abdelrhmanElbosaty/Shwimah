//
//  horseDetailsRatiosCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 07/09/2021.
//
import Foundation
import UIKit
class horseDetailsRatiosCell: UITableViewCell {

    //MARK:- Variables

    var imgArr: [UIImage]?
    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   @objc func reloadToFather(){
        print("reload vc")
    imgArr = [#imageLiteral(resourceName: "youtupe")]
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "passString"), object: self)
    }
    @objc func reloadToMother(){
         print("reload vc")
     imgArr = [#imageLiteral(resourceName: "offlineYoutube")]
     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "passString"), object: self)
     }

}

extension horseDetailsRatiosCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsRotionsCell", for: indexPath) as! DetailsRotionsCell
            cell.fatherNameOutlet.isUserInteractionEnabled = true
            cell.fatherNameOutlet.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.reloadToFather)))
            cell.motherNAmeOutlet.isUserInteractionEnabled = true
            cell.motherNAmeOutlet.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.reloadToMother)))
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsRotionsCell2", for: indexPath) as! DetailsRotionsCell2
            
                return cell
            }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width * 0.5) , height: (collectionView.frame.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("left")
        }else{
            print("right")
        }
    }
}
