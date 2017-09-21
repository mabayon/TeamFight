//
//  fight.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

class Fight {
    var players: [Player]
    
    init(_ players: [Player]) {
        self.players = players
    }

    private var description: String {
        return "\n-----Fight-----"
    }
 
    private func printTeam() {
        for player in players {
            print("\n----Player \(player.id)----")
            for hero in player.team {
                print(hero.description)
            }
        }
    }
  
    private func checkIfHeroIsAlive(_ player: Player, _ hero: inout Character?, i: Int) -> Bool {
        var validNumber: Bool
        
        if player.team[i].isAlive {
            hero = player.team[i]
            validNumber = true
        }
        else {
            print("\(player.team[i].name!) is Dead 💀")
            validNumber = false
        }
        return validNumber
    }
 
    private func selectHero(_ player: Player) -> Character {
        var hero:           Character?
        var validNumber:    Bool
        
        repeat {
            print("\nPlayer \(player.id) choose your Hero")
            validNumber = true
            if  let choice = readLine() {
                switch choice {
                case "1":
                    validNumber = checkIfHeroIsAlive(player, &hero, i: 0)
                case "2":
                    validNumber = checkIfHeroIsAlive(player, &hero, i: 1)
                case "3":
                    validNumber = checkIfHeroIsAlive(player, &hero, i: 2)
                default:
                    print("\n❌  Enter a number between 1 and 3\n")
                    validNumber = false
                }
            }
        } while !validNumber
        return hero!
    }

    private func checkIfTargetIsAlive(_ player: Player, _ hero: Character, _ target: inout Character?, i: Int) -> Bool {
        var validNumber: Bool
        
//        if player.team[i].isAlive {
            if hero.type == .mage {
                target = player.team[i]
            }
            else {
                target = player.id == 1 ? players.last?.team[i] : players.first?.team[i]
            }
            if target!.isAlive {
                hero.attack(target!)
                validNumber = true
            }
            else {
                print("\(target!.name!) is Dead 💀")
                validNumber = false
            }
//        }
//        else {
//            print("\(player.team[i].name!) is Dead 💀")
//            validNumber = false
//        }
        return validNumber
    }
  
    private func selectTarget(_ players: [Player], _ player: Player, _ hero: Character) {
        var target:         Character?
        var validNumber:    Bool
        
        repeat {
            print("\nPlayer \(player.id) choose your Target")
            validNumber = true
            if  let choice = readLine() {
                switch choice {
                case "1":
                    validNumber = checkIfTargetIsAlive(player, hero, &target, i: 0)
                case "2":
                    validNumber = checkIfTargetIsAlive(player, hero, &target, i: 1)
                case "3":
                    validNumber = checkIfTargetIsAlive(player, hero, &target, i: 2)
                default:
                    print("\n❌  Enter a number between 1 and 3\n")
                    validNumber = false
                }
            }
        } while !validNumber
    }
    
    func checkIfPlayerIsAlive(_ player: Player) -> Bool {
        for hero in player.team {
            if hero.isAlive {
                return true
            }
        }
        return false
    }
    
    func start() {
        var hero:           Character
        var play            = true
        
        print(description)
        while  play {
            for player in players {
                if player.isAlive {
                    printTeam()
                    hero = selectHero(player)
                    selectTarget(players, player, hero)
                }
                else {
                    print("🥇  Player \(player.id == 1 ? 2 : 1) Win !!!🥇")
                    play = false
                }
            }
        }
    }
}
