//
//  SearchRepositoriesViewController.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class SearchRepositoriesViewController: UIViewController {

    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var repositorySearchBar: UISearchBar!
    
    let repositoryRequest: RepositoryRequest = RepositoryRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.repositoriesTableView.tableFooterView = UIView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        repositorySearchBar?.resignFirstResponder()
        repositoryRequest.request(name: repositorySearchBar.text!, page: "1")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //todo: Create cancel request action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
