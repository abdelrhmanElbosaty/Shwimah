//
//  OfferesCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 02/09/2021.
//

import UIKit

class OfferesCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.cornerRadius = 20
            containerView.backgroundColor = .white
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 0.6
            containerView.layer.shadowRadius = 0.4
        }
    }
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
}
