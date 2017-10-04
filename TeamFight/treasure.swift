//
//  treasure.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 29/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

enum WeaponType {
    case sword
    case staff
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

class Treasure {
    var description = "Yeah you find a treasure 💼"
    
    func open(_ hero: Character) {
        if hero.type == .mage {
            hero.weapon = Staff(dmgMin: 6, dmgMax: 10)
            print("You find a staff (Attack: \(hero.weapon!.dmg!)) 🖊")
        }
        else {
            hero.weapon = Sword(dmgMin: 11, dmgMax: 21)
            print("You find a sword (Attack: \(hero.weapon!.dmg!)) 🗡")
        }
    }
}
