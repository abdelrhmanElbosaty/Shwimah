//
//  MainMenuVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 03/09/2021.
//

import UIKit
//import MOLH

class MainMenuTableVC: UITableViewController{
    

    //MARK: - Variables

   // var arr: [HomeData]?
    var imgArr: [UIImage] = [#imageLiteral(resourceName: "menuHome"),#imageLiteral(resourceName: "menuDate"),#imageLiteral(resourceName: "menuHorse"),#imageLiteral(resourceName: "menuNews"),#imageLiteral(resourceName: "menuOffers")]
    var menuNames = ["Main".localized,"Racing Calender".localized,"Stallions".localized,"Racing news".localized,"Offers and Services".localized]
    let searchbarController = UISearchController(searchResultsController: nil)
    //MARK: - Outlets

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
  

    //MARK: - Helper Functions
    
    func setupUI(){
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
    }
  
    
    func setupNavigationUI(){
        self.navigationItem.title = " "
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.transparentNavigationBar()
                navigationController?.setTintColor(#colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1))
                navigationController?.navigationBar.prefersLargeTitles = false
                navigationController?.navigationBar.backgroundColor = .clear
    }
    //MARK: - IBActions
//    @IBAction func changeLangBtnPressed(_ sender: UIButton) {
////        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
////        MOLH.reset()
//        LocalizationManager.ChangeLanguage()
//
//    }
    

}

//MARK: - Table View
extension MainMenuTableVC{
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300 : 0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return menuNames.count
        }else{
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCells",for: indexPath) as! MenuCells
            cell.cellImage.image = imgArr[indexPath.row]
            cell.cellName.text = menuNames[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuLanguageCell",for: indexPath) as! MenuLanguageCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.directionalLayoutMargins = .zero
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            print("main")
            tabBarController?.selectedIndex = 0
        }else if indexPath.section == 0 && indexPath.row == 1 {
            print("racing")
            tabBarController?.selectedIndex = 1
        }else if indexPath.section == 0 && indexPath.row == 2 {
            print("stallions")
            self.title = ""
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StallionsVC") as! StallionsVC
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 0 && indexPath.row == 3 {
            print("racing")
            tabBarController?.selectedIndex = 0
        }else if indexPath.section == 0 && indexPath.row == 4 {
            print("offers")
            tabBarController?.selectedIndex = 2
        }
    }
}

extension MainMenuTableVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
        tableView.reloadData()
    }
}
