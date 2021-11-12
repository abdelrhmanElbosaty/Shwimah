//
//  CallenderCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit

class CallenderCell: UITableViewCell {

    //MARK:- Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    //MARK:- Variables
    var navigation: UIViewController?
    var yearsArr = ["2019","2019","2020","2021"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- Helper Functions

    func setupUI(){
        collectionView.register(UINib(nibName: "CallenderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CallenderCollectionCell")
    }
}

//MARK:- CollectionView

extension CallenderCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CallenderCollectionCell", for: indexPath) as! CallenderCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width / 4) - 20
            let height = width //ratio
            return CGSize(width: width, height: height)
        
        
            // return CGSize(width: (collectionView.frame.width / 4) - 20, height: collectionView.frame.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RacesForSelectedMonth") as! RacesForSelectedMonth
        guard let navigation = navigation  else {return }
        navigation.navigationController?.pushViewController(vc, animated: true)
    }
    
}

