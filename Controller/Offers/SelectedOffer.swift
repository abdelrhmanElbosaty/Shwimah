//
//  SelectedOffer.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 03/09/2021.
//

import UIKit

class SelectedOffer: UITableViewController {

    //MARK: - Variables

   // var arr: [HomeData]?
    var img:UIImage!
    var headerTitle: String!
    var newsDescribtion: String!
    var selectedTitle: String!
    
    var selectedOffer: selectedOfferEnum?
    //MARK: - Outlets

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBarBtns()
        registerNIBCells()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
        setupNavigationUI()
        self.title = selectedTitle
    }
    //MARK: - Helper Functions
    //table View UI
    func setupUI(){
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // to make large Title and set background color
    func setupNavigationUI(){

        self.navigationController?.navigationBar.topItem?.title = ""
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
        self.navigationItem.title = selectedTitle
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
    
    func registerNIBCells(){
        switch selectedOffer {
        case .racing:
            tableView.register(UINib(nibName: "RacingHorseOffersCell", bundle: nil), forCellReuseIdentifier: "RacingHorseOffersCell")
        case .services:
            tableView.register(UINib(nibName: "ServicesAndProfessionsCell", bundle: nil), forCellReuseIdentifier: "ServicesAndProfessionsCell")
        case .supplies:
            tableView.register(UINib(nibName: "SuppliesAndFeedCompaniesCell", bundle: nil), forCellReuseIdentifier: "SuppliesAndFeedCompaniesCell")
        case .veterinary:
            tableView.register(UINib(nibName: "VeterinaryCell", bundle: nil), forCellReuseIdentifier: "VeterinaryCell")
        default:
            break;
        }
    }
    
    //MARK: - IBActions
    @objc func searchImagePressed(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Table View
extension SelectedOffer{
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedOffer {
        case .racing:
            return 5
        case .services:
            return 5
        case .supplies:
            return 5
        case .veterinary:
            return 5
        default:
            break;
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedOffer {
        case .racing:
            tableView.allowsSelection = true
            let cell =  tableView.dequeueReusableCell(withIdentifier: "RacingHorseOffersCell",for: indexPath) as!
                RacingHorseOffersCell
            return cell
        case .services:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "ServicesAndProfessionsCell",for: indexPath) as! ServicesAndProfessionsCell
            return cell
        case .supplies:
           
            let cell =  tableView.dequeueReusableCell(withIdentifier: "SuppliesAndFeedCompaniesCell",for: indexPath) as! SuppliesAndFeedCompaniesCell
            return cell
        case .veterinary:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "VeterinaryCell",for: indexPath) as! VeterinaryCell
            return cell
        case .none:
            break;
        }
        return UITableViewCell()
    }

        
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if selectedOffer == .racing{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SelectedHorseInOffers") as! SelectedHorseInOffers
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
        
        

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        switch selectedOffer {
//        case .racing:
//            return SCREENHeights / 9
//        case .services:
//            return SCREENHeights / 9
//        case .supplies:
//            return SCREENHeights / 9
//        case .veterinary:
//            return SCREENHeights / 9
//        default:
//            break;
//        }
        return SCREENHeights / 9
        
    }
    
}


