//
//  ServicesAndProfessionsCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 02/09/2021.
//

import UIKit

class ServicesAndProfessionsCell: UITableViewCell {

    @IBOutlet weak var phoneLbl: UILabel!{
        didSet{
            phoneLbl.text = "phone".localized
        }
    }
    @IBOutlet weak var containerViewOutlegt: UIView!{
        didSet{
            containerViewOutlegt.backgroundColor = .white
            containerViewOutlegt.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerViewOutlegt.layer.shadowOpacity = 0.2
            containerViewOutlegt.layer.shadowRadius = 0.2
        }
    }
    @IBOutlet weak var serviceMan: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
