//
//  DetailsRotionsCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 07/09/2021.
//

import UIKit

class DetailsRotionsCell: UICollectionViewCell {
    
    @IBOutlet weak var fatherNameOutlet: UILabel!
    @IBOutlet weak var motherNAmeOutlet: UILabel!
    @IBOutlet weak var containerViewInCollection: UIView!{
        didSet{
            containerViewInCollection.layer.borderColor = UIColor.gray.cgColor
            containerViewInCollection.layer.borderWidth = 1
        }
    }
}
