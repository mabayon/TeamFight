//
//  character.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

// Enumeration of the different character types
enum CharacterType {
    case warrior
    case mage
    case colossus
    case dwarf
}

// Class Warrior contains all informations of the Warrior
class Warrior: Character {
    override init() {
        super.init()
        type    = .warrior
        hp    = 100
        hpMax = hp
        weapon = Sword(dmgMin: 10, dmgMax: 10)
    }
}

// Class Mage contains all informations of the Mage
class Mage: Character {
    override init() {
        super.init()
        type    = .mage
        hp    = 85
        hpMax = hp
        weapon = Staff(dmgMin: 5, dmgMax: 5)
    }
    
    // Override func attack to heal instead of attack the target
    override func attack(_ target: Character) {
        print("\n💗  \(self.name!) Heal \(target.name!) 💗")
        if target.hp + weapon!.dmg! < target.hpMax {
            target.hp += weapon!.dmg!
            print("✨  + \(weapon!.dmg!) HP")
        }
        else {
            print("✨  + \((target.hpMax) - (target.hp)) HP")
            target.hp = target.hpMax
        }
        print("\(target.name!) HP = \(target.hp)/\(target.hpMax)")
    }
}

// Class Dwarf contains all informations of the Dwarf
class Dwarf: Character {
    override init() {
        super.init()
        type    = .dwarf
        hp    = 85
        hpMax = hp
        weapon = Axe(dmgMin: 13, dmgMax: 13)
    }
}

// Class Colossus contains all informations of the Colossus
class Colossus: Character {
    override init() {
        super.init()
        type    = .colossus
        hp    = 200
        hpMax = hp
        weapon = Hammer(dmgMin: 6, dmgMax: 6)
    }
}

// Class Character contains all informations of the character (Name, type, id...)
class Character {
    
    // Name of the character
    var name:   String?
    // type of the charcter
    var type:   CharacterType?
    // Unique id to identify the character
    var id      = 0
    // Current hp of the character
    var hp      = 0
    // Hp Maximum of the character
    var hpMax   = 0
    // Weapon carry by the character
    var weapon: Weapon?

    // Boolean to check if character is still alive
    var isAlive: Bool {
        if hp <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    // Description of the character that contains the id, the name, the type, his life and the damage of the weapon
    var description: String {
        var info = "\(id). \(name!) Faction: \(type!) HP: \(hp)/\(hpMax) DMG: \(weapon!.dmg!)"
       
        switch weapon!.type! {
        case .staff:
            info.append("  ⚡️")
        case .sword:
            info.append("  🗡")
        case .axe:
            info.append("  ⛏")
        case .hammer:
            info.append("  🔨")
        }
        
        if !isAlive {
            info.append("  ☠️")
        }
        return info
    }
    
    // Inflict damage to a target
    func attack(_ target: Character) {
        print("\n⚔️  \(self.name!) Attack \(target.name!)  ⚔️")
        if target.hp - weapon!.dmg! > 0 {
            target.hp = target.hp - weapon!.dmg!
            print("\n💢  - \(weapon!.dmg!) HP")
        }
        else {
            print("\n💢  - \(target.hp) HP")
            target.hp = 0
        }
        print("\(target.name!) HP = \(target.hp)/\(target.hpMax)")
    }
}
