//
//  MenuLanguageCell.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 03/09/2021.
//

import UIKit

class MenuLanguageCell: UITableViewCell {

    @IBOutlet weak var selectLangLBL: UILabel!{
        didSet{
            if UserDefaults.standard.string(forKey: "app_lang") == "ar"{
                selectLangLBL.text = "selectLang".localized
            }else{
                selectLangLBL.text = "selectLang".localized
            }
        }
    }
    @IBOutlet weak var selectLangBtnOutlet: UIButton!{
        didSet{
            selectLangBtnOutlet.layer.cornerRadius = selectLangBtnOutlet.frame.height / 2
            if UserDefaults.standard.string(forKey: "app_lang") == "ar"{
                selectLangBtnOutlet.setTitle("lang".localized, for: .normal)
            }else{
                selectLangBtnOutlet.setTitle("lang".localized, for: .normal)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func selectLangBtnPressed(_ sender: UIButton) {
                LocalizationManager.ChangeLanguage()

    }
}
