//
//  Weapon.swift
//  InfinityRoster
//
//  Created by Badlazzor on 2018. 06. 12..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

class Weapon {
    typealias Range = (from: UInt, to: UInt, bonus: Int)
    
    let name: String
    let ranges: [Range]
    let damage: UInt
    let burst: UInt
    let ammo: [Ammo]
    let traits: [Trait]
    
    init(name: String, ranges: [Range], damage: UInt, burst: UInt, ammo: [Ammo], traits: [Trait]) {
        self.name = name
        self.ranges = ranges
        self.damage = damage
        self.burst = burst
        self.ammo = ammo
        self.traits = traits
    }
}
