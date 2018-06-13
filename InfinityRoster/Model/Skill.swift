//
//  Skill.swift
//  InfinityRoster
//
//  Created by Badlazzor on 2018. 06. 12..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

class Skill {
    let name: String
    let requirements: [String]
    let effects: [String]
    let desc: String
    let discussion: String
    
    let divisions: [Action]
    let labels: [Label]
    let traits: [Trait]
    let levels: [(level: Level, skill: Skill)]
    
    init(name: String,
         requirements: [String],
         effects: [String],
         desc: String,
         discussion: String,
         divisions: [Action],
         labels: [Label],
         traits: [Trait],
         levels: [(level: Level, skill: Skill)]) {

        self.name = name
        self.requirements = requirements
        self.effects = effects
        self.desc = desc
        self.discussion = discussion
        self.divisions = divisions
        self.labels = labels
        self.traits = traits
        self.levels = levels
    }
}
