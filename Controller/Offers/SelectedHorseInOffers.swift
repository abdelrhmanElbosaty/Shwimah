//
//  SelectedHorseInOffers.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 06/09/2021.
//

import UIKit

class SelectedHorseInOffers: UIViewController {
    
    //MARK: - Variables
    var horseNameString: String?

    //MARK: - Outlets
    @IBOutlet weak var backBtn: UIButton!{
        didSet{
            if UserDefaults.standard.string(forKey: "app_lang") == "ar"{
                let img:UIImage = #imageLiteral(resourceName: "ArbArrow")
                backBtn.setImage(img, for: .normal)
            }else{
                let img:UIImage = #imageLiteral(resourceName: "whiteBackArrow")
                backBtn.setImage(img, for: .normal)
            }
        }
    }
    
    @IBOutlet weak var horseName: UILabel!
    @IBOutlet weak var horseProfieImg: UIImageView!{
        didSet{
            horseProfieImg.layer.cornerRadius = horseProfieImg.frame.height / 7
            horseProfieImg.layer.borderWidth = 2
            horseProfieImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupUI()
        setupGesture()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - Helper Functions
    
    func setupUI()  {
        tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.listenToNotifi), name: NSNotification.Name("passString"), object: nil)
        horseName.text = horseNameString ?? "barq"
    }
    func setupGesture(){
        
    }
    @objc func listenToNotifi(notfi: Notification){
        if let cell = notfi.object as? horseDetailsRatiosCell{
    
                if cell.imgArr != nil {
                    self.horseProfieImg.image = cell.imgArr?.first
                }else{
                    print("Found Nil")
                }
            }
        }
    //MARK: - IBActions
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
//MARK: - TableView


extension SelectedHorseInOffers: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "horseDetailsRatiosCell",for:indexPath) as! horseDetailsRatiosCell
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RewardsCell",for:indexPath) as! RewardsCell
            cell.totalRewardLBL.text = "Total Rewards 4DK"
            return cell
        }else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RewardsCell",for:indexPath) as! RewardsCell
            cell.totalRewardLBL.text = "Unavilable"
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width, height:40))
            label.text = "Details Rotions"
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            returnedView.addSubview(label)
            return returnedView
        }
        else if section == 1{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width / 5, height:40))
            let label1 = UILabel(frame: CGRect(x: label.frame.width, y:0, width:tableView.frame.width, height:40))
            label.text = "Product : "
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label1.text = "Khaled "
            label1.textColor = #colorLiteral(red: 0.03167077899, green: 0.4302278161, blue: 0.5448768139, alpha: 1)
            returnedView.addSubview(label)
            returnedView.addSubview(label1)
            return returnedView
        }
        else if section == 2{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width / 5, height:40))
            let label1 = UILabel(frame: CGRect(x: label.frame.width, y:0, width:tableView.frame.width, height:40))
            label.text = "Contact : "
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label1.text = "6545342 "
            label1.textColor = #colorLiteral(red: 0.03167077899, green: 0.4302278161, blue: 0.5448768139, alpha: 1)
            returnedView.addSubview(label)
            returnedView.addSubview(label1)
            return returnedView
        }
        else if section == 3{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width, height:40))
            label.text = "Awards "
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            returnedView.addSubview(label)
            return returnedView
        }
        else if section == 4{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width / 3, height:40))
            let label1 = UILabel(frame: CGRect(x: label.frame.width, y:0, width:tableView.frame.width, height:40))
            label.text = "Race Record : "
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label1.text = " Unavaliable "
            label1.textColor = #colorLiteral(red: 0.03167077899, green: 0.4302278161, blue: 0.5448768139, alpha: 1)
            returnedView.addSubview(label)
            returnedView.addSubview(label1)
            return returnedView
        }
        else{
            let returnedView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:45)) //set these values as necessary
            returnedView.backgroundColor = UIColor.lightGray
            returnedView.backgroundColor = .white
            let label = UILabel(frame: CGRect(x:3, y:0, width:tableView.frame.width, height:40))
            label.text = "About "
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            returnedView.addSubview(label)
            return returnedView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.section == 0{
            return SCREENHeights / 3
        }else if  indexPath.section == 1{
            return SCREENHeights / 35
        }else if  indexPath.section == 2{
            return SCREENHeights / 35
        }else if  indexPath.section == 3{
            return SCREENHeights / 20
        }else if  indexPath.section == 4{
            return SCREENHeights / 35
        }else{
            return SCREENHeights / 20
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
