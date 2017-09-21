//
//  character.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

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
        hp    = 0
        hpMax = hp
        dmg     = 10
    }
}

class Mage: Character {
    override init() {
        super.init()
        type    = .mage
        hp    = 85
        hpMax = hp
        dmg     = 15
    }
    
    override func attack(_ target: Character) {
        print("\n💗  \(self.name!) Heal \(target.name!) 💗")
        if target.hp + self.dmg < target.hpMax {
            target.hp += self.dmg
            print("✨  + \(self.dmg) HP")
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
        dmg     = 15
    }
}

class Colossus: Character {
    override init() {
        super.init()
        type    = .colossus
        hp    = 0
        hpMax = hp
        dmg     = 5
    }
}

class Character {
    var name:   String?
    var type:   CharacterType?
    var id      = 0
    var hp      = 0
    var hpMax   = 0
    var dmg     = 0
    
    var isAlive: Bool {
        if hp <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    var description: String {
        var info = "\(id). \(name!) Faction: \(type!) HP: \(hp)/\(hpMax) DMG: \(dmg)"
        if !isAlive {
            info.append("  ☠️")
        }
        return info
    }
    
    func attack(_ target: Character) {
        print("\n⚔️  \(self.name!) Attack \(target.name!)  ⚔️")
        if target.hp - self.dmg > 0 {
            target.hp = target.hp - self.dmg
            print("\n💢  - \(self.dmg) HP")
        }
        else {
            target.hp = 0
            print("\n💢  - \(target.hp) HP")
        }
        print("\(target.name!) HP = \(target.hp)/\(target.hpMax)")
    }
}
