//
//  HomeVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit

class HomeVC: UITableViewController {
    
    //MARK: - Variables
    
    // var arr: [HomeData]?
    var arr: [UIImage] = [#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "splash")]
    
    //MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarBtns()
        setupUI()
        
        
        for family in UIFont.familyNames{
            let sName:String = family as String
            //print(sName)
            for name in UIFont.fontNames(forFamilyName: sName){
                print(name)
            }
                    
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }
    //MARK: - Helper Functions
    
    // tableView custmization
    func setupUI(){
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    // to make large Title and set background color
    func setupNavigationUI(){
        self.navigationItem.title = "Shwimah".localized
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
        
        let Img = UIImageView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        Img.image = #imageLiteral(resourceName: "barHourse")
        Img.contentMode = .scaleAspectFill
        let leftBtn = UIBarButtonItem(customView: Img)
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    //MARK: - IBActions
    @objc func searchImagePressed(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Table View
extension HomeVC{
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCell",for: indexPath) as! HomeCell
        //        cell.imageView?.image = arr![indexPath.row].image
        //        cell.newsHeaderLBL.text = arr![indexPath.row].headTitle
        //        cell.newsDescriptionLBL.text = arr![indexPath.row].newsDescribtion
        //cell.imageView?.image = arr[indexPath.row]
        cell.backgroundColor = .clear
        cell.newsHeaderLBL.text = "سباقات شويمة"
        cell.newsDescriptionLBL.text = "قريبا سباق الخيل العربي في الأراضي الكويتيه بحضور افضل متسابقين علي  مستوي العالم جهز نفسك لتكون ضمن افضل المتسابقين"
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENHeights * 0.3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsDetailsVC") as! NewsDetailsVC
        vc.img = arr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

