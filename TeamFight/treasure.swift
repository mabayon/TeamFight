//
//  treasure.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 29/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

// Health Potion that cure a random amount of life
class HealthPotion {
    
     // Heal a random amount of life
    func heal(_ hero: Character) {
        
        // Random amount of life between 5 and 10
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

// Bomb that removes a random amount of life
class Bomb {
    
    // Remove a random amount of life
    func explosion(_ hero: Character) {
        
        // Random damage between 1 and 5
        let dmg = Int(arc4random_uniform(UInt32(5))) + 100
        print("💣   BOOM  💣")
        if hero.hp - dmg > 0 {
            hero.hp = hero.hp - dmg
            print("\n💢  - \(dmg) HP")
            print("\(hero.name!) HP = \(hero.hp)/\(hero.hpMax)")
        }
        else {
            print("\n💢  - \(hero.hp) HP")
            hero.hp = 0
            print("\(hero.name!) is Dead 💀")
        }
    }
}

// Class Treasure manage what the hero will find in the treasure
class Treasure {
    
    // Description of the treasure
    var description = "\nYou find a treasure 💼"
    
    // Equips the character with the weapon found
    private func weaponFound(_ hero: Character) {
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
    
    // Select a random object (Weapon, potion or bomb)
    func random_object(_ hero: Character) {
        let randomNum = Int(arc4random_uniform(4))
        switch randomNum {
        case 0:
            weaponFound(hero)
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
