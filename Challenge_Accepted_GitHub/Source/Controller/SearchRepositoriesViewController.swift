//
//  SearchRepositoriesViewController.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class SearchRepositoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var repositorySearchBar: UISearchBar!
    
    let repositoryRequest: RepositoryRequest = RepositoryRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repositoriesTableView.delegate = self
        self.repositoriesTableView.dataSource = self
        
        configureTableView()
    }
    
    func configureTableView() {
        self.repositoriesTableView.isUserInteractionEnabled = false
        self.repositoriesTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
        self.repositoriesTableView.tableFooterView = UIView()
        self.repositoriesTableView.reloadData()
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

extension SearchRepositoriesViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
