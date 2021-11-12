//
//  TabBar.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 03/09/2021.
//

import UIKit

class TabBar: UITabBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if UserDefaults.standard.string(forKey: "app_lang") == "ar" {
            //TabBar.appearance().semanticContentAttribute = .forceRightToLeft
            if let myItem = self.items?[2]{
                myItem.image = #imageLiteral(resourceName: "unselectedOffer")
                myItem.selectedImage = #imageLiteral(resourceName: "selectedOffer")
            }
            if let item = self.items?[0]{
                item.image = #imageLiteral(resourceName: "unselectedHome")
                item.selectedImage = #imageLiteral(resourceName: "selectedHome")
            }
            if let item = self.items?[1]{
                item.image = #imageLiteral(resourceName: "unselectedDate")
                item.selectedImage = #imageLiteral(resourceName: "selectedDate")
            }
        }else{
         //   TabBar.appearance().semanticContentAttribute = .forceLeftToRight
            if let myItem = self.items?[2]{
                myItem.image = #imageLiteral(resourceName: "EnUnselectedOffer")
                myItem.selectedImage = #imageLiteral(resourceName: "EnSelectedOffer")
            }
            if let item = self.items?[0]{
                item.image = #imageLiteral(resourceName: "EnUnselectedHome")
                item.selectedImage = #imageLiteral(resourceName: "EnSelectedHome")
            }
            if let item = self.items?[1]{
                item.image = #imageLiteral(resourceName: "EnUnselectedDate")
                item.selectedImage = #imageLiteral(resourceName: "EnSelectedDate")
            }
        }
        
        //        if "lang".localized == "en"{
        //            if let myItem = self.items?[2]{
        //                myItem.image = #imageLiteral(resourceName: "EnUnselectedOffer")
        //                myItem.selectedImage = #imageLiteral(resourceName: "EnSelectedOffer")
        //            }
        //            if let item = self.items?[0]{
        //                item.image = #imageLiteral(resourceName: "EnUnselectedHome")
        //                item.selectedImage = #imageLiteral(resourceName: "EnSelectedHome")
        //            }
        //            if let item = self.items?[1]{
        //                item.image = #imageLiteral(resourceName: "EnUnselectedDate")
        //                item.selectedImage = #imageLiteral(resourceName: "EnSelectedDate")
        //            }
        //        }else{
        //            if let myItem = self.items?[2]{
        //                myItem.image = #imageLiteral(resourceName: "unselectedOffer")
        //                myItem.selectedImage = #imageLiteral(resourceName: "selectedOffer")
        //            }
        //            if let item = self.items?[0]{
        //                item.image = #imageLiteral(resourceName: "unselectedHome")
        //                item.selectedImage = #imageLiteral(resourceName: "selectedHome")
        //            }
        //            if let item = self.items?[1]{
        //                item.image = #imageLiteral(resourceName: "unselectedDate")
        //                item.selectedImage = #imageLiteral(resourceName: "selectedDate")
        //            }
        //        }
    }
    
}
