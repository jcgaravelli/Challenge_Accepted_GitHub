//
//  UserRequest.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit
import Alamofire


class UserRequest: NSObject {
        
    func request(name: String, page: String, success:@escaping (_ dict: Dictionary<String, Any>?) -> (), failure:@escaping (Error?) -> ()) {
        
        let jsonParameters: Parameters = [:]
    
        Alamofire.request("https://api.github.com/search/users?q="+name+"&page="+page, method: .get, parameters: jsonParameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
             switch(response.result) {
                case .success(_):
                    //todo: Create Error Handling and Alerts 
                    if response.result.value != nil {
                        success(response.result.value as! Dictionary<String, Any>?)
                    }
                break

                case .failure(_):
                    print(response.result.error!)
                break
            }
        }
    }
}
