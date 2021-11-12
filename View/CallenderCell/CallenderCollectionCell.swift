//
//  CallenderCollectionCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit

class CallenderCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.cornerRadius = 3
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowRadius = 8
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
