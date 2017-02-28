//
//  XMainViewController.swift
//  Challenge_Accepted_GitHub
//
//  Created by Julio Cesar Garavelli on 28/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class XMainViewController: UIViewController {
    @IBOutlet weak var xUsersButton: UIButton!
    @IBOutlet weak var xRepositoriesButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //xUsersButton color.
        self.xUsersButton.layer.cornerRadius = 10
        self.xUsersButton.layer.borderWidth = 1
        self.xUsersButton.layer.borderColor = UIColor.borderGray().cgColor
        
        //xRepositoriesButton color.
        self.xRepositoriesButton.layer.cornerRadius = 10
        self.xRepositoriesButton.layer.borderWidth = 1
        self.xRepositoriesButton.layer.borderColor = UIColor.borderGray().cgColor
        
        //Navigation settings color.
        self.navigationController?.navigationBar.barTintColor = UIColor.borderGray()
        self.navigationController?.navigationBar.tintColor = UIColor.xYellow()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.xYellow()]
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.xYellow()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
