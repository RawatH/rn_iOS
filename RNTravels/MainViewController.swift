//
//  RootViewController.swift
//  RNTravels
//
//  Created by Harish on 27/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRootViewController()
        // Do any additional setup after loading the view.
    }
    
    func initRootViewController()  {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let isUserLoggedIn = false
        
        if isUserLoggedIn{
            let rootVC = mainStoryBoard.instantiateViewController(withIdentifier: "RNNavigationVC") as! UINavigationController
             self.viewControllers = [rootVC]
            navigationController?.setNavigationBarHidden(true, animated: true)
            
        }else{
            navigationController?.setNavigationBarHidden(true, animated: true)
            let rootVC = mainStoryBoard.instantiateViewController(withIdentifier: "RNLoginVC") as! LoginViewController
            self.viewControllers = [rootVC]
        }
        
        
    }
    
}
