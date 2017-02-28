//
//  Repository.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 28/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class Repository: NSObject {
    var id: NSNumber!
    var name: String!
    var fullName: String?
    var language: String?
    var descript: String?
    var fork: NSNumber?
    var forks: NSNumber?
    var stargazers: NSNumber?
    var updatedAt: String?
    
    
    //Dictionary Repositories
    init(dict: [String : Any]){
        self.id = dict["id"] as! NSNumber!
        self.name = dict["name"] as! String
        self.fullName = dict["full_name"] as? String
        self.language = dict["language"] as? String
        self.descript = dict["description"] as? String
        self.fork = dict["fork"] as? NSNumber
        self.forks = dict["forks"] as? NSNumber
        self.stargazers = dict["stargazers_count"] as? NSNumber
        self.updatedAt = dict["updated_at"] as? String
    }
}
