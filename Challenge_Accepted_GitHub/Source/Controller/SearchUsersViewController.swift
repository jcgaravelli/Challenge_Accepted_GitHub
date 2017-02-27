//
//  SearchUsersViewController.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 25/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class SearchUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
    let userRequest: UserRequest = UserRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self

        configureTableView()
    }
    
    func configureTableView() {
        self.usersTableView.isUserInteractionEnabled = false
        self.usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        self.usersTableView.tableFooterView = UIView()
        self.usersTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchBar?.resignFirstResponder()
        userRequest.request(name: userSearchBar.text!, page: "1", success: { users in
                let userListArray = users?["items"]
                if ((userListArray as AnyObject).count)! > 0 {
                    print(userListArray!)
                } else {
                    print("Nenhum item encontrado!")
                }
            }, failure: { error in
                print("Não foi possível encontrar as informações.")
            })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //todo: Create cancel request action
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

extension SearchUsersViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
