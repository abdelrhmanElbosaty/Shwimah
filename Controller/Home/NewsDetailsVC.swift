//
//  NewsDetailsVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 01/09/2021.
//

import UIKit

class NewsDetailsVC: UITableViewController {
    
    //MARK: - Variables
    var img:UIImage!
    var headerTitle: String!
    var newsDescribtion: String!
    
    //MARK: - Outlets
    
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
    
    // tableView custmization
    func setupUI(){
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    // to make large Title and set background color
    func setupNavigationUI(){
        self.navigationItem.title = "News_Details".localized
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
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    // To add searchBtn and left logo
    func setupNavigationBarUI(){
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

//MARK: - Table View
extension NewsDetailsVC{
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "NewsDetailesCell",for: indexPath) as! NewsDetailesCell
        cell.headerTitleLBL.text = "سباقات شويمة"
        cell.newsDetails.text = "نيسمبري/سبزيسنبتز .يس،بز.يسشتب،وريب.ز يبتن.ي،رشوب .شسمبزس و قريبا سباق الخيل العربي في الأراضي الكويتيه بحضور افضل متسابقين علي  مستوي العالم جهز نفسك لتكون ضمن افضل المتسابقين, العالم ,  العالم , العالم , العالم , العالم  .يس،بز.يسشتب،وريب.ز يبتن.ي،رشوب .شسمبزس و قريبا سباق الخيل العربي في الأراضي الكويتيه بحضور افضل متسابقين علي  مستوي العالم جهز نفسك لتكون ضمن افضل المتسابقين, العالم ,  العالم , العالم , العالم , العالم  .يس،بز.يسشتب،وريب.ز يبتن.ي،رشوب .شسمبزس و قريبا سباق الخيل العربي في الأراضي الكويتيه بحضور افضل متسابقين علي  مستوي العالم جهز نفسك لتكون ضمن افضل المتسابقين, العالم ,  العالم , العالم , العالم , العالم "
        return cell
    }
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return SCREENHeights * 0.6
    //    }
}


