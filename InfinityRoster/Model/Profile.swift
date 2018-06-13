//
//  Profile.swift
//  InfinityRoster
//
//  Created by Badlazzor on 2018. 06. 12..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

struct Attribute {
    enum Value {
        enum Availability {
            case Total
            case Numbered(UInt)
        }
        
        typealias Movement = (first: UInt, second: UInt)
        
        case basic(UInt)
        case availability(Availability)
        case movement(Movement)
    }
    
    enum Key: String {
        case MOV
        case CC
        case BS
        case PH
        case WIP
        case ARM
        case BTS
        case W
        case STR
        case S
        case AVA
        case SWC
        case C
    }
    
    let key: Key
    let value: Value
}

protocol AttributeProvider {
    var attributes: [Attribute] { get }
}

protocol SkillProvider {
    var skills: [Skill] { get }
}

protocol EquipmentProvider {
    var equipment: [Equipment] { get }
}

protocol WeaponProvider {
    var weapons: [Weapon] { get }
}

protocol AssociateProvider {
    var associates: [Profile] { get }
}

class Profile: AttributeProvider, SkillProvider, EquipmentProvider, WeaponProvider, AssociateProvider {
    let ISC: String
    let name: String
    let type: ProfileType
    let classification: Classification
    let characteristics: [Characteristics]
    
    let forms: [Form]
    let loadouts: [Loadout]
    
    init(ISC: String, name: String, type: ProfileType, classification: Classification, characteristics: [Characteristics], forms: [Form], loadouts: [Loadout]) {
        self.ISC = ISC
        self.name = name
        self.type = type
        self.classification = classification
        self.characteristics = characteristics
        self.forms = forms
        self.loadouts = loadouts
    }
    
    var attributes: [Attribute] {
        return forms.reduce([Attribute](), { $0 + $1.attributes })
    }
    
    var skills: [Skill] {
        return forms.reduce([Skill](), { $0 + $1.skills }) + loadouts.reduce([Skill](), { $0 + $1.skills })
    }
    
    var equipment: [Equipment] {
        return forms.reduce([Equipment](), { $0 + $1.equipment }) + loadouts.reduce([Equipment](), { $0 + $1.equipment })
    }
    
    var weapons: [Weapon] {
        return forms.reduce([Weapon](), { $0 + $1.weapons }) + loadouts.reduce([Weapon](), { $0 + $1.weapons })
    }
    
    var associates: [Profile] {
        return loadouts.reduce([Profile](), { $0 + $1.associates })
    }
}

extension Profile {
    enum ProfileType: UInt {
        case LI
        case MI
        case HI
        case REM
        case SK
    }
    
    enum Classification: UInt {
        case LineTroops
        case SpecTrainedTroops
        case VeteranTroops
        case EliteTroops
        case HeadquartersTroops
        case SupportTroops
        case Character
        case MercenaryTroops
    }
    
    enum Characteristics {
        enum BackupOption {
            case None
            case Cube
            case Cube2
        }
        
        enum TrainingOption {
            case Irregular
            case Regular
        }
        
        enum FuryOption {
            case None
            case Frenzy
            case Impetuous
            case ExtremlyImpetuous
        }
        
        case Backup(BackupOption)
        case Training(TrainingOption)
        case Fury(FuryOption)
        case Hackable(Bool)
    }
    
    class Form: AttributeProvider, SkillProvider, EquipmentProvider, WeaponProvider {
        let attributes: [Attribute]
        let skills: [Skill]
        let equipment: [Equipment]
        let weapons: [Weapon]
        
        init(attributes: [Attribute], skills: [Skill], equipment: [Equipment], weapons: [Weapon]) {
            self.attributes = attributes
            self.skills = skills
            self.equipment = equipment
            self.weapons = weapons
        }
    }
    
    class Loadout: SkillProvider, EquipmentProvider, WeaponProvider, AssociateProvider {
        let associates: [Profile]
        let skills: [Skill]
        let equipment: [Equipment]
        let weapons: [Weapon]
        
        init(skills: [Skill], equipment: [Equipment], weapons: [Weapon], associates: [Profile]) {
            self.associates = associates
            self.skills = skills
            self.equipment = equipment
            self.weapons = weapons
        }
    }
}
