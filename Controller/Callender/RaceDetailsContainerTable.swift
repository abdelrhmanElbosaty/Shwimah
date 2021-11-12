//
//  RaceDetailsVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 08/09/2021.
//

import UIKit
class RaceDetailsContainerTable: UITableViewController {
    
    //MARK: - Outlets
    
    //MARK: - Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //MARK: - Helper Functions
    
    func setupUI(){
        tableView.tableFooterView = UIView()
        
    }


//MARK: - IBActions




}
//MARK: - TableView

extension RaceDetailsContainerTable{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "RacesForSelectedMonthCell") as! RacesForSelectedMonthCell
    //        return cell
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENHeights / 15
    }
    
}

