//
//  HelperFunctions.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 02/11/2021.
//

import UIKit


enum selectedOfferEnum: String {
    case racing
    case services
    case veterinary
    case supplies
    
    func labelTitle() -> String {
        switch self {
        case .racing:
            return "Racing horse offers".localized
        case .services:
            return "Services and professions".localized
        case .veterinary:
            return "Veterinary Care".localized
        case .supplies:
            return "Horse supplies,\n Equestrian and fodder".localized
        }
    }
}

//class HelperFunctions: UINavigationController{
//    class func setupNavigationUI(){
//        navigationItem.title = "News_Details".localized
//        navigationController?.navigationBar.prefersLargeTitles = true
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = #colorLiteral(red: 0.1599657834, green: 0.2374417782, blue: 0.4208174348, alpha: 1)
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.compactAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//        navigationController?.setStatusBar(backgroundColor:#colorLiteral(red: 0.1586027443, green: 0.2414858043, blue: 0.4206615686, alpha: 1))
//        navigationController?.navigationBar.topItem?.title = ""
//    }
//}
