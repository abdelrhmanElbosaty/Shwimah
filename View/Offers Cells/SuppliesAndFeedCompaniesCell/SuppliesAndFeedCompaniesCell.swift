//
//  SuppliesAndFeedCompaniesCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 02/09/2021.
//

import UIKit

class SuppliesAndFeedCompaniesCell: UITableViewCell {
    
    @IBOutlet weak var phoneLbl: UILabel!{
        didSet{
            phoneLbl.text = "phone".localized
        }
    }
    @IBOutlet weak var containerViewOutlet: UIView!{
        didSet{
            containerViewOutlet.backgroundColor = .white
            containerViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerViewOutlet.layer.shadowOpacity = 0.2
            containerViewOutlet.layer.shadowRadius = 0.2
        }
    }
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
