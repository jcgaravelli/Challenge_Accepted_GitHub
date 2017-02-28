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
    var repositoryList: [Repository] = []
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        self.repositoriesTableView.delegate = self
        self.repositoriesTableView.dataSource = self
        let edgeInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        self.repositoriesTableView.contentInset = edgeInset
        self.repositoriesTableView.isUserInteractionEnabled = true
        self.repositoriesTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
        self.repositoriesTableView.tableFooterView = UIView()
        self.repositoriesTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //initial values
        self.repositoryList = []
        currentPage = 1
        self.repositoriesTableView.reloadData()
        
        repositorySearchBar?.resignFirstResponder()
        searchRequest()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //todo: Create cancel request action
    }
    
    func searchRequest() {
        repositoryRequest.request(name: repositorySearchBar.text!, page: String(currentPage), success: { repositories in
            guard let repositoryListArray = repositories?["items"] else {
                return
            }
            if ((repositoryListArray as AnyObject).count)! > 0 {
                self.setupRepositories(repositories: repositoryListArray as! Array<Any>)
            } else {
                print("Nenhum item encontrado!")
            }
        }, failure: { error in
                print(error!)
                print("Não foi possível encontrar as informações.")
        })
    }
    
    func setupRepositories(repositories: Array<Any>) {
        for repository in repositories {
            self.repositoryList.append(Repository.init(dict: repository as! [String : Any]))
        }
        DispatchQueue.main.async(execute: {
            self.repositoriesTableView.reloadData()
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchRepositoriesViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        cell.setupInfoRepository(repository: repositoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repositoryList.count - 1 && repositoryList.count >= 30 {
            currentPage += 1
            searchRequest()
        }
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
