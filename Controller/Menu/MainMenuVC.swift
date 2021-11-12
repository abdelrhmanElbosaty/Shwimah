//
//  MainMenuVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 09/09/2021.
//

import UIKit
import MaterialComponents.MaterialTabs_TabBarView
class MainMenuVC: UIViewController {

    //MARK:- Variables
    
    //MARK:- Outlets
    @IBOutlet weak var searchTF: UITextField!{
        didSet{
            searchTF.placeholder = "Search".localized
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
    @IBOutlet weak var SearchContainerView: UIView!{
        didSet{
            SearchContainerView.layer.cornerRadius = 5
            SearchContainerView.layer.shadowColor = UIColor.lightGray.cgColor
            SearchContainerView.layer.shadowRadius = 5
            SearchContainerView.layer.shadowOpacity = 3
        }
    }
    @IBOutlet weak var tabBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tabBarView: MDCTabBarView!{
        didSet{
            tabBarView.layer.cornerRadius = 5
            tabBarView.layer.shadowColor = UIColor.lightGray.cgColor
            tabBarView.layer.shadowRadius = 5
            tabBarView.layer.shadowOpacity = 3
        }
    }
    @IBOutlet weak var dropDownBtnOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchbar()
        setupTapRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
        setupNavigationUI()
    }
    
    //MARK:- Helper Functions
    func setupUI(){
        
        
      
    }
    func setupNavigationUI(){
        navigationController?.setTintColor(#colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1))
        navigationController?.transparentNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .clear
        self.navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.setStatusBar(backgroundColor:.white)
    }
    
    // to setup dropDownView
    func setupSearchbar(){
        self.dropDownBtnOutlet.setImage(#imageLiteral(resourceName: "downArrow"), for: .normal)
        tabBarView.items = [
            UITabBarItem(title: "Horse", image: nil, tag: 0),
            UITabBarItem(title: "Jocky", image: nil, tag: 0),
            UITabBarItem(title: "Breeder", image: nil, tag: 0),
            UITabBarItem(title: "Trainer", image: nil, tag: 0),
            UITabBarItem(title: "Owner", image: nil, tag: 0)
        ]
        tabBarView.setTitleFont(UIFont(name: "Avenir", size: 12), for: .normal)
        tabBarView.preferredLayoutStyle = .fixed
        tabBarView.minItemWidth = 17
        tabBarView.rippleColor = .clear
        tabBarView.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        tabBarView.setTitleColor(#colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1), for: .selected)
        tabBarView.selectionIndicatorStrokeColor = #colorLiteral(red: 0, green: 0.6143774986, blue: 0.7439641953, alpha: 1)
    }
    
    func setupTapRecognizer(){
        SearchContainerView.isUserInteractionEnabled = true
        SearchContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goToSearchVC)))
        searchTF.isUserInteractionEnabled = true
        searchTF.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goToSearchVC)))
        searchTF.isUserInteractionEnabled = true
    }
    
    //MARK:- IBActions

    @objc func goToSearchVC(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func dropDownBtnPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

