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
    
    init(dictionary: [String : Any]){
        self.id = dictionary["id"] as! NSNumber
        self.login = dictionary["login"] as! String
        self.avatarUrl = dictionary["avatar_url"] as? String
    }
    
    
}
