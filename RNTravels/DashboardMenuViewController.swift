//
//  DashboardMenuViewController.swift
//  RNTravels
//
//  Created by Harish on 01/03/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class DashboardMenuViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var drawerMenu:[String] = ["Trips" ,"Contact Info" ,"Notification","Password","Profile","Forex Rates","Google Translate","Logout"]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drawerMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrawerCell", for: indexPath) as! DrawerMenuCellItem
        cell.title.text = drawerMenu[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrawerCell", for: indexPath) as! DrawerMenuCellItem
        print("\(drawerMenu[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


}
