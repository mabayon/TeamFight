//
//  weapon.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 05/10/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

// Enumeration of the different weapon types
enum WeaponType {
    case sword
    case staff
    case axe
    case hammer
}

// Contains all informations of the Hammer
class Hammer: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .hammer
    }
}

// Contains all informations of the Axe
class Axe: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .axe
    }
}

// Contains all informations of the Staff
class Staff: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .staff
    }
}

// Contains all informations of the Sword
class Sword: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .sword
    }
}

// Contains all informations of the Weapon
class Weapon {
    var dmg: Int?
    var type: WeaponType?
}
