//
//  StallionsCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 07/09/2021.
//

import UIKit

class StallionsCell: UICollectionViewCell {
    @IBOutlet weak var horseProfileImg: UIImageView!{
        didSet{
            horseProfileImg.layer.cornerRadius = horseProfileImg.frame.height / 7
        }
    }
    @IBOutlet weak var horseName: UILabel!
    
}
