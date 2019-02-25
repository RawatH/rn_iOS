//
//  LoginViewController.swift
//  RNTravels
//
//  Created by Harish on 20/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class LoginViewController: BaseViewController {

    @IBOutlet weak var popupBg: UIButton!
    @IBOutlet weak var fbBtnContainer: UIView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var reqPasswordPopup: UIView!
    @IBOutlet weak var popupCenterConstraint: NSLayoutConstraint!
    
    var paramsDict:[String:String]=[:]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        popupCenterConstraint.constant =  -500
        reqPasswordPopup.layer.cornerRadius = 10
        reqPasswordPopup.layer.masksToBounds = true
        addFbLoginBtn()
      
        // Do any additional setup after loading the view.
    }
    
    
    func addFbLoginBtn(){
        let fbLoginBtn = FBSDKLoginButton()
        fbLoginBtn.readPermissions = ["public_profile"]
        fbLoginBtn.center = CGPoint(x: fbBtnContainer.frame.size.width  / 2,
                                     y: fbBtnContainer.frame.size.height / 2)
        fbBtnContainer.addSubview(fbLoginBtn)
    }

    
    func toggleReqPasswordCenterConstraint(_ showPopup :Bool) {
        popupCenterConstraint.constant = showPopup ? 0 : -500
        popupBg.alpha = showPopup ? 0.5 : 0
        UIView.animate(withDuration: 0.25, animations: {self.view.layoutIfNeeded()})
    }
    
    @IBAction func showRequestPasswordPopup(_ sender: Any) {
        toggleReqPasswordCenterConstraint(true)
    }
    
    @IBAction func closeReqPasswordPopup(_ sender: Any) {
         toggleReqPasswordCenterConstraint(false)
    }
    
    
    @IBAction func reqForNewPassword(_ sender: Any) {
        
    }
    
    @IBAction func moveToDashboard(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DashboardViewController")
        self.present(controller, animated: true, completion: nil)
    }

}
