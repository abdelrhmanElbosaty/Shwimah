//
//  SearchVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit
//import MaterialComponents.MaterialTabs_TabBarView
class SearchVC: UIViewController {
    
    //MARK: - Variables
    
    var menuArr = ["Horse".localized,"Jocky".localized,"Breeder".localized,"Trainer".localized,"Owner".localized]
    var indecatorView = UIView()
    let indecatorHeight: CGFloat = 3
    var selectedIndex = 0
    
    
    //MARK: - Outlets
    @IBOutlet weak var searchViweLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
            collectionView.layer.shadowRadius = 2
            collectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
            collectionView.layer.shadowOpacity = 0.8
            collectionView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var searchBtnOutlet: UIButton!{
        didSet{
            if UserDefaults.standard.string(forKey: "app_lang") == "ar"{
                searchBtnOutlet.setTitle("search".localized, for: .normal)
            }else{
                searchBtnOutlet.setTitle("search".localized, for: .normal)
            }
        }
    }
    @IBOutlet weak var searchContainerView: UIView!{
        didSet{
            searchContainerView.layer.cornerRadius = 5
            searchContainerView.layer.shadowColor =  UIColor.lightGray.withAlphaComponent(0.5).cgColor
            searchContainerView.layer.shadowRadius = 4
            searchContainerView.layer.shadowOpacity = 1
            searchContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    @IBOutlet weak var searchTF: UITextField!{
        didSet{
            if UserDefaults.standard.string(forKey: "app_lang") == "ar"{
                searchTF.textAlignment = .right
                searchTF.placeholder = "Search".localized
            }else{
                searchTF.textAlignment = .left
                searchTF.placeholder = "Search".localized
            }
        }
    }
    @IBOutlet weak var dropDownBtnOutlet: UIButton!
    @IBOutlet weak var dropDownTopConstraint: NSLayoutConstraint!
//    @IBOutlet weak var dropDownView: MDCTabBarView!{
//        didSet{
//            dropDownView.layer.cornerRadius = 5
//            dropDownView.layer.shadowColor =  UIColor.lightGray.withAlphaComponent(0.5).cgColor
//            dropDownView.layer.shadowRadius = 4
//            dropDownView.layer.shadowOpacity = 1
//            dropDownView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupSearchbar()
        setupIndecator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }

   
    //MARK: - Helper Functions
    // setup navigation control
    func setupUI(){
        navigationController?.transparentNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.setStatusBar(backgroundColor:.white)
        self.dropDownBtnOutlet.setImage(#imageLiteral(resourceName: "downArrow"), for: .normal)

    }
    // to setup dropDown View
    func setupSearchbar(){
//        dropDownView.items = [
//            UITabBarItem(title: "Horse", image: nil, tag: 0),
//            UITabBarItem(title: "Jocky", image: nil, tag: 0),
//            UITabBarItem(title: "Breeder", image: nil, tag: 0),
//            UITabBarItem(title: "Trainer", image: nil, tag: 0),
//            UITabBarItem(title: "Owner", image: nil, tag: 0)
//        ]
//        dropDownView.setTitleFont(UIFont(name: "Avenir", size: 12), for: .normal)
//        dropDownView.preferredLayoutStyle = .fixed
//        dropDownView.minItemWidth = 17
//        dropDownView.rippleColor = .clear
//        dropDownView.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//        dropDownView.setTitleColor(#colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1), for: .selected)
//        dropDownView.selectionIndicatorStrokeColor = #colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1)
    }
    
    func setupIndecator(){
        indecatorView.backgroundColor = #colorLiteral(red: 0, green: 0.5076485276, blue: 0.6416093707, alpha: 1)
        let xPoint = collectionView.frame.minX + 5
        let yPoint = collectionView.frame.maxY - indecatorHeight
        let sysFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let width = menuArr[0].width(withConstrainedHeight: collectionView.frame.height + 10 , font: sysFont)
        
        indecatorView.frame = CGRect(x: xPoint, y: yPoint, width: width, height: indecatorHeight)
        collectionView.addSubview(indecatorView)
        hundelIndecator()
    }
    
    func hundelIndecator(){
        let sysFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let width = estimatedFrame(text: menuArr[selectedIndex], font: sysFont).width + 25
        var desiredX: CGFloat = 15
        let yPoint = collectionView.frame.maxY - indecatorHeight
        
        for i in 0..<selectedIndex{
            
            desiredX += estimatedFrame(text: menuArr[i], font: sysFont).width
            desiredX += 35
        }
        
        UIView.animate(withDuration: 0.5) {
            self.indecatorView.frame = CGRect(x: desiredX, y: yPoint, width: width, height: self.indecatorHeight)
        }
    }
    
    //MARK:- IBActions
    
    @IBAction func dropDownBtnPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            if self.dropDownBtnOutlet.currentImage == UIImage(named: "downArrow") {
                self.dropDownTopConstraint.constant =  self.searchContainerView.frame.height + 2
                self.dropDownBtnOutlet.setImage(#imageLiteral(resourceName: "upArrow"), for: .normal)
            }else{
                self.dropDownTopConstraint.constant = 0
                self.dropDownBtnOutlet.setImage(#imageLiteral(resourceName: "downArrow"), for: .normal)
            }
            self.view.layoutIfNeeded()
        }
    }

}

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DropDownSearchCell", for: indexPath) as! DropDownSearchCell
        cell.nameLbl.text = menuArr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sysFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)

        let estimatedWidth = menuArr[indexPath.row].width(withConstrainedHeight: collectionView.frame.height + 20 , font: sysFont)
        
        return CGSize(width: estimatedWidth + 25, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        hundelIndecator()
        self.searchViweLbl.text = menuArr[indexPath.row]
    }
}
