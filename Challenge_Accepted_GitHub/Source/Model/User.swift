//
//  User.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 28/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id: NSNumber!
    var login: String!
    var avatarUrl: String?
    
    init(dict: [String : Any]){
        self.id = dict["id"] as! NSNumber
        self.login = dict["login"] as! String
        self.avatarUrl = dict["avatar_url"] as? String
    }
}
