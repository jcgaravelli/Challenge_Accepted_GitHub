//
//  UserRequest.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit
import Alamofire

protocol UserRequestDelegate {

}

class UserRequest: NSObject {
    
    var userRequestDelegate: UserRequestDelegate?
    
    
    func request(name: String, page: String) {
        
        let jsonParameters: Parameters = [:]
    
        Alamofire.request("https://api.github.com/search/users?q="+name+"&page="+page, method: .get, parameters: jsonParameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
             switch(response.result) {
                case .success(_):
                    //todo: Create Error Handling and Alerts 
                    if response.result.value != nil{
                        print(response.result.value!)
                    }
                break

                case .failure(_):
                    print(response.result.error!)
                break
            }
        }
    }
    
}
