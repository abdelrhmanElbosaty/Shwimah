//
//  NewsDetailesCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 01/09/2021.
//

import UIKit

class NewsDetailesCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
            containerView.layer.shadowRadius = 2
            containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            containerView.layer.shadowOpacity = 0.8
            containerView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var headerTitleLBL: UILabel!
   // @IBOutlet weak var newsDetails: UILabel!
    @IBOutlet weak var newsDetails: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
