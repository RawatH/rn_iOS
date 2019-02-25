//
//  NetworkContants.swift
//  RNTravels
//
//  Created by Harish on 22/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import Foundation

class NetworkConstants {
    static let BASE_URL:String = "http://qzipsolutions.com/travel/api"
    
    static let REGISTRATION_ENDPOINT:String = "/registerClient"
    
    static func getRegistrationUrl()-> String{
        return NetworkConstants.BASE_URL+NetworkConstants.REGISTRATION_ENDPOINT
    }
}



