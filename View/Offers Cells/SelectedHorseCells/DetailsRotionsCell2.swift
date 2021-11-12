//
//  DetailsRotionsCell2.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 07/09/2021.
//

import UIKit

class DetailsRotionsCell2: UICollectionViewCell {
    
    @IBOutlet weak var containerViewForCell: UIView!{   didSet{
        containerViewForCell.layer.borderColor = UIColor.gray.cgColor
        containerViewForCell.layer.borderWidth = 1
    }
}
}
