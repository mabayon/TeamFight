//
//  fight.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

class Fight {
    var players: [Player]
    
    init(_ players: [Player]) {
        self.players = players
    }

    private var description: String {
        return "\n-----Fight-----"
    }
 
    private func printTeams() {
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
    
    func start() {
        var hero:           Character
        
        print(description)
        while  players.first!.isAlive && players.last!.isAlive {
            for player in players {
                printTeams()
                hero = selectHero(player)
                let randomNum = Int(arc4random_uniform(2))
                if randomNum == 1 {
                    let treasure = Treasure()
                    print(treasure.description)
                    treasure.random_object(hero)
                }
                selectTarget(players, player, hero)
                if !players.first!.isAlive || !players.last!.isAlive {
                    break
                }
            }
        }
        for player in players {
            if player.isAlive {
                print("🥇  Player \(player.id) Win !!!🥇")
            }
        }
    }
}
