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
    let alert:NotificationAlertAction = NotificationAlertAction()
    var userList: [User] = []
    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        
        configureTableView()
    }
    
    func configureTableView() {
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
        self.usersTableView.isUserInteractionEnabled = true
        self.usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        self.usersTableView.tableFooterView = UIView()
        self.usersTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //initial values
        self.userList = []
        currentPage = 1
        DispatchQueue.main.async(execute: {
            self.usersTableView.reloadData()
        })

        userSearchBar?.resignFirstResponder()
        searchRequest()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //todo: Create cancel request action
        userSearchBar.text = ""
    }
    
    func searchRequest() {
        userRequest.request(name: userSearchBar.text!, page: String(currentPage), success: { users in
            guard let userListArray = users?["items"] else {
                return
            }
            if ((userListArray as AnyObject).count)! > 0 {
                self.setupUsers(users: userListArray as! Array<Any>)
            } else {
                self.alert.notification("Nenhum item encontrado!")
            }
        }, failure: { error in
                print(error!)
                self.alert.notification("Não foi possível encontrar as informações.")
        })
    }
    
    func setupUsers(users: Array<Any>) {
        for user in users {
            self.userList.append(User.init(dict: user as! [String : Any]))
        }
        DispatchQueue.main.async(execute: {
            self.usersTableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

extension SearchUsersViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.setupInfoUser(user: userList[indexPath.row])
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == userList.count - 1 && userList.count >= 30 {
            currentPage += 1
            searchRequest()
        }
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
