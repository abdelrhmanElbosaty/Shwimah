//
//  OfferesVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 02/09/2021.
//

import UIKit

class OffersVC: UIViewController {
    
    //MARK: - Variables
    
    // var arr: [HomeData]?
    var imgArr: [UIImage] = [#imageLiteral(resourceName: "Offers-care"),#imageLiteral(resourceName: "Offers-equipments"),#imageLiteral(resourceName: "Offers-servicess"),#imageLiteral(resourceName: "Offers-race")]
    //    var servicesArr = ["Veterinary Care", "Horse supplies,\n Equestrian and fodder" ,"Services and professions" ,"Racing horse offers"]
    var servicesArr: [selectedOfferEnum] = [.veterinary , .supplies , .services , .racing]
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarBtns()
        setupUI()
        self.navigationController?.navigationBar.barStyle = .black
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }
    //MARK: - Helper Functions
    
    func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // to make large Title and set background color
    func setupNavigationUI(){
        self.navigationItem.title = "Offers and Services".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.1599657834, green: 0.2374417782, blue: 0.4208174348, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont(name: "Lato-Semibold", size: 20)!]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont(name: "Lato-Semibold", size: 22)!]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.setStatusBar(backgroundColor:#colorLiteral(red: 0.1586027443, green: 0.2414858043, blue: 0.4206615686, alpha: 1))
    }
    // To add searchBtn and left logo
    func setupNavigationBarBtns(){
        
        let searchImg = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchImg.setImage(#imageLiteral(resourceName: "searchIcon"), for: .normal)
        searchImg.contentMode = .scaleAspectFill
        let searchBtn = UIBarButtonItem(customView: searchImg)
        self.navigationItem.rightBarButtonItem = searchBtn
        searchImg.addTarget(self, action: #selector(self.searchImagePressed), for: .touchUpInside)
    }
    //MARK: - IBActions
    
    @objc func searchImagePressed(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Collection View
extension OffersVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferesCell", for: indexPath) as! OfferesCell
        
        cell.imageOutlet.image = imgArr[indexPath.row]
        cell.serviceName.text = servicesArr[indexPath.row].labelTitle()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SelectedOffer") as! SelectedOffer
        vc.selectedOffer = servicesArr[indexPath.row]
        if indexPath.row == 1 {
            vc.selectedTitle = "Supplies and feed companies".localized
        }else{
            vc.selectedTitle = servicesArr[indexPath.row].labelTitle()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width * 0.5) - 10 , height: (collectionView.frame.height * 0.5) - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

