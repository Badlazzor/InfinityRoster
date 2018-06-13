//
//  Ammo.swift
//  InfinityRoster
//
//  Created by Badlazzor on 2018. 06. 12..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

class Ammo {
    enum Category: String {
        case Standard
        case Exotic
        case BioMunition
    }
    
    let name: String
    let category: Category
    
    init(name: String, category: Category) {
        self.name = name
        self.category = category
    }
}
