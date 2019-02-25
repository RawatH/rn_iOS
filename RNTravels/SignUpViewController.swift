//
//  SignUpViewController.swift
//  RNTravels
//
//  Created by Harish on 21/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var confirmedPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var travelId: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstname: UITextField!
    

    var paramsDict:[String:String]=[:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareParamDict(){
         paramsDict["first_name"] = firstname.text ?? "harish_ios"
         paramsDict["last_name"]  = lastName.text ?? "rawat_ios"
         paramsDict["email"] = email.text ?? "h@harish.com"
         paramsDict["fb_id"] = ""
         paramsDict["fcm_key"] = "1"
         paramsDict["number"] = phoneNumber.text ?? "223344"
         paramsDict["password"] = password.text  ?? "1234"
         paramsDict["user_name"] = userName.text ?? "1234"
         paramsDict["travel_id"] = travelId.text ?? ""
    }

    @IBAction func register(_ sender: Any) {
        
    
        guard let registerUrl = URL(string: NetworkConstants.getRegistrationUrl() ) else{
            return
        }
        
        prepareParamDict()
        
        var request = URLRequest(url: registerUrl)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: paramsDict, options: []) else {
            return
        }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                return
            }
            
            print(data)
            
            guard let response = response else{
                return
            }
            
            print(response)
        }.resume()
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
