//
//  NetworkManager.swift
//  pimation
//
//  Created by shishir sapkota on 6/11/16.
//  Copyright © 2016 shishir sapkota. All rights reserved.
//
import Alamofire
import SwiftyJSON

protocol NetworkManagerDelegate {
    func didAuthenticateWithResult(token: String?, error: String?)
}

class NetworkManager {
    static let sharedInstance = NetworkManager()
    var delegate: NetworkManagerDelegate? = nil
    init(){}
    
    func authencicate(email: String, password: String, url: String) {
        
        let params = ["user" : ["email" : "\(email)", "password" : "\(password)"]]
        
        Alamofire.request(.POST, url, parameters: params, encoding: .JSON, headers: nil).validate().responseJSON{
            response in
            switch response.result{
            case .Success:
                if let value = response.result.value{
                    print("success")
                    let jsn = JSON(value)
                    let authentication_token = jsn["token"]
                    if(authentication_token != nil){
                        print("authenticated.")
                        self.delegate?.didAuthenticateWithResult(authentication_token.string!, error: nil)
                    }else {
                        print("authentication failed")
                        self.delegate?.didAuthenticateWithResult(nil, error: jsn["error"].string!)
                    }
                }
                break
            case .Failure:
                print("failed to established connection.")
                self.delegate?.didAuthenticateWithResult(nil, error: "cannot reach the server. check connections")
                break
            }
        }
    }
    
}
