//
//  RaceDetailsVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit

class RaceDetailsVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var addCandidateBtnOutlet: UIButton!{
        didSet{
            addCandidateBtnOutlet.layer.cornerRadius = 5
        }
    }
    //MARK: - Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarBtns()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationUI()
    }
    
    //MARK: - Helper Functions
    
    func setupUI(){
    }
    
    // to make large Title and set background color
    func setupNavigationUI(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "Race Details".localized
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
    
    // To add searchBtn
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
    
    
    @IBAction func addCandidateBtnPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddCandidateVC") as! AddCandidateVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

