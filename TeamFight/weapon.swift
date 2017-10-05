//
//  weapon.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 05/10/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

enum WeaponType {
    case sword
    case staff
    case axe
    case hammer
}

class Hammer: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .hammer
    }
}

class Axe: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .axe
    }
}

class Staff: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .staff
    }
}

class Sword: Weapon {
    init(dmgMin: Int, dmgMax: Int) {
        super.init()
        dmg = Int(arc4random_uniform(UInt32(dmgMax - dmgMin))) + dmgMin
        type = .sword
    }
}

class Weapon {
    var dmg: Int?
    var type: WeaponType?
}
