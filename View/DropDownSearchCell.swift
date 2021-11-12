//
//  DropDownSearchCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 01/11/2021.
//

import UIKit

class DropDownSearchCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!{
        didSet{
            nameLbl.textColor = .gray
        }
    }
    
    override var isSelected: Bool{
        didSet{
           if isSelected{
             
               self.nameLbl.textColor = #colorLiteral(red: 0, green: 0.5076485276, blue: 0.6416093707, alpha: 1)
            }else{
                //self.backgroundColor = .clear
                self.nameLbl.textColor = .gray
            }
        }
    }
}
