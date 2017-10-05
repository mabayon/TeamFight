//
//  character.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

enum CharacterType {
    case warrior
    case mage
    case colossus
    case dwarf
}

class Warrior: Character {
    override init() {
        super.init()
        type    = .warrior
        hp    = 100
        hpMax = hp
        weapon = Sword(dmgMin: 10, dmgMax: 10)
    }
}

class Mage: Character {
    override init() {
        super.init()
        type    = .mage
        hp    = 85
        hpMax = hp
        weapon = Staff(dmgMin: 5, dmgMax: 5)
    }
    
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

class Dwarf: Character {
    override init() {
        super.init()
        type    = .dwarf
        hp    = 85
        hpMax = hp
        weapon = Axe(dmgMin: 13, dmgMax: 13)
    }
}

class Colossus: Character {
    override init() {
        super.init()
        type    = .colossus
        hp    = 200
        hpMax = hp
        weapon = Hammer(dmgMin: 6, dmgMax: 6)
    }
}

class Character {
    var name:   String?
    var type:   CharacterType?
    var id      = 0
    var hp      = 0
    var hpMax   = 0
    var weapon: Weapon?
    
    var isAlive: Bool {
        if hp <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
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
