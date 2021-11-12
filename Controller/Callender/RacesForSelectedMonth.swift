//
//  RacesForSelectedMonth.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit

class RacesForSelectedMonth: UIViewController {
    
    //MARK:- Outlets
    
    //MARK:- Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarBtns()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "Races for ..".localized
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
    
    //MARK:- IBActions
    @objc func searchImagePressed(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
//MARK:- TableView

extension RacesForSelectedMonth: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RacesForSelectedMonthCell") as! RacesForSelectedMonthCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENHeights / 7
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RaceDetailsVC") as! RaceDetailsVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

