//
//  Identifiable.swift
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

import UIKit

protocol Identifiable {}

extension Identifiable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
