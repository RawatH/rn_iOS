//
//  BaseViewController.swift
//  RNTravels
//
//  Created by Harish on 20/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,MenuDelegate {
    
    var isMenuOpen:Bool = false
    var menuVC : MenuViewController?
    
    
    //Open MENU
    @IBAction func slideOutMenu(_ sender: Any) {
        toggleMenuController();
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC?.menuDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onMenuItemSelected(_ drawerItem : String) {
        toggleMenuController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var nextVC:BaseViewController!
        
        switch drawerItem {
        case DrawerItem.Trips.rawValue :
            if self is DashboardViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"DashboardViewController") as? BaseViewController
            }
        case DrawerItem.ContactInfo.rawValue:
             if self is ContactInfoViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"ContactInfoViewController") as? BaseViewController
            }
        case DrawerItem.Notification.rawValue:
             if self is NotificationViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"NotificationViewController") as? BaseViewController
            }
        case DrawerItem.Password.rawValue:
             if self is PackageDetailController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"PackageDetailController") as? BaseViewController
            }
        case DrawerItem.Profile.rawValue:
             if self is ProfileViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"ProfileViewController") as? BaseViewController
            }
        case DrawerItem.ForexRates.rawValue:
             if self is ConversionViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"ConversionViewController") as? BaseViewController
            }
        case DrawerItem.GoogleTranslate.rawValue:
             if self is GTranslateViewController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"GTranslateViewController") as? BaseViewController
            }
        case DrawerItem.Logout.rawValue:
             if self is PackageDetailController == false {
            nextVC = storyboard.instantiateViewController(withIdentifier:"PackageDetailController") as? BaseViewController
            }
        default:
            nextVC = nil
        }
        
        if nextVC != nil {

            self.navigationController?.pushViewController(nextVC, animated: true)
            
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
    
    
    
}
