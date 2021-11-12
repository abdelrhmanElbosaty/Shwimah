//
//  String+Extension.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 11/10/2021.
//

import Foundation
import UIKit
//extension String{
//    var localized:String{
//        return NSLocalizedString(self,comment: "")
//    }
//}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}


func estimatedFrame(text: String, font: UIFont) -> CGRect {
    let size = CGSize(width: 0, height: 0)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    return NSString(string: text).boundingRect(with: size
                                               , options: options
                                               , attributes: [NSAttributedString.Key.font: font]
                                               , context: nil)
}
