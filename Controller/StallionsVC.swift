//
//  StallionsVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 07/09/2021.
//

import UIKit

class StallionsVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: - Variables
var horsesName = ["Barq","Boundoq","Boundoq","Boundoq","Boundoq","Boundoq","Barq","Barq","Barq","Barq","Barq"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBarUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }
    //MARK:- Helper Functions

    func setupUI(){
    }
    // to make large Title and set background color
    func setupNavigationUI(){
        self.navigationItem.title = "Stallions".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.1599657834, green: 0.2374417782, blue: 0.4208174348, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.setStatusBar(backgroundColor:#colorLiteral(red: 0.1586027443, green: 0.2414858043, blue: 0.4206615686, alpha: 1))
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupNavigationBarUI(){
        let searchImg = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchImg.setImage(#imageLiteral(resourceName: "searchIcon"), for: .normal)
        searchImg.contentMode = .scaleAspectFill
        
        let second = UIBarButtonItem(customView: searchImg)
        
        self.navigationItem.rightBarButtonItem = second
        
        searchImg.addTarget(self, action: #selector(self.imagePressed), for: .touchUpInside)
    }
    //MARK: - IBActions
    @objc func imagePressed(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension StallionsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horsesName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StallionsCell", for: indexPath) as! StallionsCell
        cell.horseName.text = horsesName[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 20, height: collectionView.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SelectedHorseInOffers") as! SelectedHorseInOffers
     //   vc.horseProfieImg.image =  imageArr
        print(horsesName[indexPath.row])
        //vc.horseName.text = horsesName[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
