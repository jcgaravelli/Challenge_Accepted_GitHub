//
//  UserTableViewCell.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width / 3;
        self.avatarImage.clipsToBounds = true;
    }
    
    func setupInfoUser(user: User) {
        loginLabel.text = user.login
        
        let url = URL(string: user.avatarUrl!)
        DispatchQueue.global().async {
            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                if data != nil {
                    self.avatarImage.image = UIImage(data: data!)
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
