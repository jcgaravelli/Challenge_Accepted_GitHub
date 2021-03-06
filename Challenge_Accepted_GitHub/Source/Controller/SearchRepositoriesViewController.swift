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
    let alert:NotificationAlertAction = NotificationAlertAction()
    var repositoryList: [Repository] = []
    var currentPage = 1
    
    
    //MARK: - View lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        configureTableView()
    }
    
    //MARK: - Private Methods
    func configureTableView() {
        self.repositoriesTableView.delegate = self
        self.repositoriesTableView.dataSource = self
        self.repositoriesTableView.isUserInteractionEnabled = true
        self.repositoriesTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
        self.repositoriesTableView.tableFooterView = UIView()
        self.repositoriesTableView.reloadData()
    }
    
    
    //MARK: - SearchBar Delegate
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
        repositorySearchBar.text = ""
    }
    
    
    //Search request repository.
    func searchRequest() {
        repositoryRequest.request(name: repositorySearchBar.text!, page: String(currentPage), success: { repositories in
            guard let repositoryListArray = repositories?["items"] else {
                return
            }
            if ((repositoryListArray as AnyObject).count)! > 0 {
                self.setupRepositories(repositories: repositoryListArray as! Array<Any>)
            } else {
                self.alert.notification("Nenhum item encontrado!")
            }
        }, failure: { error in
            print(error!)
            self.alert.notification("Não foi possível encontrar as informações.")
        })
    }
    
    
    //Setup repository tableView.
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


//MARK: TableViewDataSource

extension SearchRepositoriesViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        
        //configure cell
        cell.setupInfoRepository(repository: repositoryList[indexPath.row])
        cell.isUserInteractionEnabled = false
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
