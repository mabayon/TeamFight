//
//  treasure.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 29/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

class HealthPotion {
    func heal(_ hero: Character) {
        let heal = Int(arc4random_uniform(UInt32(6))) + 5
        print("You find a potion  💉")
        if hero.hp + heal < hero.hpMax {
            hero.hp += heal
            print("💗  + \(heal) HP")
        }
        else {
            print("💗  + \((hero.hpMax) - (hero.hp)) HP")
            hero.hp = hero.hpMax
        }
        print("\(hero.name!) HP = \(hero.hp)/\(hero.hpMax)")
    }
}

class Bomb {
    func explosion(_ hero: Character) {
        let dmg = Int(arc4random_uniform(UInt32(5))) + 1
        print("💣   BOOM  💣")
        if hero.hp - dmg > 0 {
            hero.hp = hero.hp - dmg
            print("\n💢  - \(dmg) HP")
        }
        else {
            print("\n💢  - \(hero.hp) HP")
            hero.hp = 0
        }
        print("\(hero.name!) HP = \(hero.hp)/\(hero.hpMax)")
    }
}

class Treasure {
    var description = "\nYeah you find a treasure 💼"
    
    private func weaponFind(_ hero: Character) {
        switch hero.type! {
        case .mage:
            hero.weapon = Staff(dmgMin: 6, dmgMax: 10)
            print("You find a staff (Heal: \(hero.weapon!.dmg!)) ⚡️")
        case .warrior:
            hero.weapon = Sword(dmgMin: 11, dmgMax: 21)
            print("You find a sword (Attack: \(hero.weapon!.dmg!)) 🗡")
        case .colossus:
            hero.weapon = Hammer(dmgMin: 7, dmgMax: 14)
            print("You find a hammer (Attack: \(hero.weapon!.dmg!)) 🔨")
        case .dwarf:
            hero.weapon = Axe(dmgMin: 11, dmgMax: 21)
            print("You find a axe (Attack: \(hero.weapon!.dmg!)) ⛏")
        }
    }
    
    
    func random_object(_ hero: Character) {
        let randomNum = Int(arc4random_uniform(4))
        switch randomNum {
        case 0:
            weaponFind(hero)
        case 1:
            let potion = HealthPotion()
            potion.heal(hero)
        case 2:
            let bomb = Bomb()
            bomb.explosion(hero)
        default:
            print("🕸   The safe is empty  🕸")
        }
    }
}
