//
//  Faction.swift
//  InfinityRoster
//
//  Created by Badlazzor on 2018. 06. 13..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

protocol Faction {
    var name: String { get }
    var profiles: [Profile] { get }
}

struct Army {
    let name: String
    let sectorials: [Sectorial]
}

struct Sectorial: Faction {
    let name: String
    let profiles: [Profile]
}
