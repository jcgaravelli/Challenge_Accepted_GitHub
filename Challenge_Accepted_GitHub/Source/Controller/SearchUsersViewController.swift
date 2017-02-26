//
//  SearchUsersViewController.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 25/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class SearchUsersViewController: UIViewController, UserRequestDelegate {

    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
    let userRequest: UserRequest = UserRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.usersTableView.tableFooterView = UIView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchBar?.resignFirstResponder()
        userRequest.request(name: userSearchBar.text!, page: "1")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //todo: Create cancel request action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
