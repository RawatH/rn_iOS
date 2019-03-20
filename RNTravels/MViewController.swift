//
//  MViewController.swift
//  RNTravels
//
//  Created by Harish on 19/03/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class MViewController: BaseViewController , MenuDelegate {
    
    var isMenuOpen:Bool = false
    var menuVC : MenuViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuItems()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        menuVC?.menuDelegate = self
        // Do any additional setup after loading the view.
    }
    
    func setupMenuItems(){
        let menuImage = UIImage(named: "icons8-menu-24")!
        let notificationImage  = UIImage(named: "notification_icon")!
        
        let menuButton = UIBarButtonItem(image: menuImage,  style: .plain, target: self,  action: #selector(menuItemClicked))
        menuButton.title = "Menu"
        let notificationButton = UIBarButtonItem(image: notificationImage,  style: .plain, target: self,  action: #selector(menuItemClicked))
        notificationButton.title = "Notification"
        
        navigationItem.rightBarButtonItems = [menuButton, notificationButton]
    }
    
    @objc func menuItemClicked(sender:UIBarButtonItem){
        if let title = sender.title {
            switch title {
            case "Menu":
                toggleMenuController()
            case "Notification":
                print ("Notification clicked")
            default:
                 print ("---- clicked")
                
            }
        }
    }
    
    func toggleMenuController() {
        
        if !isMenuOpen{
            if let menuVC = menuVC {
                self.addChildViewController(menuVC)
                self.view.addSubview(menuVC.view)
                isMenuOpen = true
            }
        }else{
            if let menuVC = menuVC {
                menuVC.view.removeFromSuperview()
                isMenuOpen = false
            }
        }
    }
    
    func onMenuItemSelected(_ drawerItem : String) {
        toggleMenuController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var nextVC:MViewController!
        
        switch drawerItem {
        case DrawerItem.Trips.rawValue :
            if self is DashboardViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"DashboardViewController") as? MViewController
            }
        case DrawerItem.ContactInfo.rawValue:
            if self is ContactInfoViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"ContactInfoViewController") as? MViewController
            }
        case DrawerItem.Notification.rawValue:
            if self is NotificationViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"NotificationViewController") as? MViewController
            }
        case DrawerItem.Password.rawValue:
            if self is PackageDetailController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"PackageDetailController") as? MViewController
            }
        case DrawerItem.Profile.rawValue:
            if self is ProfileViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"ProfileViewController") as? MViewController
            }
        case DrawerItem.ForexRates.rawValue:
            if self is ConversionViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"ConversionViewController") as? MViewController
            }
        case DrawerItem.GoogleTranslate.rawValue:
            if self is GTranslateViewController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"GTranslateViewController") as? MViewController
            }
        case DrawerItem.Logout.rawValue:
            if self is PackageDetailController == false {
                nextVC = storyboard.instantiateViewController(withIdentifier:"PackageDetailController") as? MViewController
            }
        default:
            nextVC = nil
        }
        
        if let nextVC = nextVC {
            if let viewControllers = self.navigationController?.viewControllers {
                for vc in viewControllers {
                   
                }
            }
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
}
