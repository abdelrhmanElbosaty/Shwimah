//
//  CallenderVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit

class CallenderVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Variables

    var yearsArr = ["2020","2021","2019"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarBtns()
        setupUI()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }

    //MARK: - Helper Functions

    func setupUI(){
        tableView.register(UINib(nibName: "CallenderCell", bundle: nil), forCellReuseIdentifier: "CallenderCell")
        tableView.tableHeaderView = UIView()
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
    }
    //MARK: - IBActions

    @objc func searchImagePressed(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - TableView

extension CallenderVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if yearsArr.contains("2021") || yearsArr.contains("2022"){
            return 2
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallenderCell") as! CallenderCell
        cell.navigation = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENHeights / 6
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if yearsArr.contains("2021") || yearsArr.contains("2022"){
            if section == 0{
                return "Next_Race".localized
            }else{
                return "Last_Race".localized
            }
        }else{
            return "Last_Race".localized
        }
    }
}

