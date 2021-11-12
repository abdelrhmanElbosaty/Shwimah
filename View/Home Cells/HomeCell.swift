//
//  HomeCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.backgroundColor = .white
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 0.3
            containerView.layer.shadowRadius = 0.4
        }
    }
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var newsHeaderLBL: UILabel!
    @IBOutlet weak var newsDescriptionLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
