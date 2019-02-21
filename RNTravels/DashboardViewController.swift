//
//  DashboardViewController.swift
//  RNTravels
//
//  Created by Harish on 21/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNextViewController()
        // Do any additional setup after loading the view.
    }
    
    func loadNextViewController(){
        let isUserLogged = true
        if isUserLogged {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
