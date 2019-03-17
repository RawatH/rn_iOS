//
//  DashboardMenuViewController.swift
//  RNTravels
//
//  Created by Harish on 01/03/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

protocol MenuDelegate {
    func onMenuItemSelected(_ drawerItem : String)
    func toggleMenuController()
}

enum DrawerItem : String {
    case Trips = "Trips"
    case ContactInfo = "Contact Info"
    case Notification = "Notification"
    case Password = "Password"
    case Profile = "Profile"
    case ForexRates = "Forex Rates"
    case GoogleTranslate = "Google Trasnslate"
    case Logout = "Logout"
}

class MenuViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var menuDelegate:MenuDelegate!
    
    
    var drawerMenu:[String] = [DrawerItem.Trips.rawValue ,
                               DrawerItem.ContactInfo.rawValue ,
                               DrawerItem.Notification.rawValue ,
                               DrawerItem.Password.rawValue ,
                               DrawerItem.Profile.rawValue ,
                               DrawerItem.ForexRates.rawValue ,
                               DrawerItem.GoogleTranslate.rawValue ,
                               DrawerItem.Logout.rawValue
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
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
        menuDelegate.onMenuItemSelected(drawerMenu[indexPath.row]);
    }

}
