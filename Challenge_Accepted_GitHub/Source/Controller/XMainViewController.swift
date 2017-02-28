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
        
        self.navigationController?.isNavigationBarHidden = true
        
        //xUsersButton color.
        self.xUsersButton.layer.cornerRadius = 10
        self.xUsersButton.layer.borderWidth = 1
        self.xUsersButton.layer.borderColor = UIColor.borderGray().cgColor
        
        //xRepositoriesButton color.
        self.xRepositoriesButton.layer.cornerRadius = 10
        self.xRepositoriesButton.layer.borderWidth = 1
        self.xRepositoriesButton.layer.borderColor = UIColor.borderGray().cgColor
        

        // Do any additional setup after loading the view.
        
        
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
