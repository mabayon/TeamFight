//
//  fight.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation


// Manage the different step of the fight
class Fight {
    
    // List of the different players
    var players: [Player]
    
    init(_ players: [Player]) {
        self.players = players
    }
    
    // Description of the class fight
    private var description: String {
        return "\n-----Fight-----"
    }
 
    // Print the team of the player
    private func printTeams() {
        for player in players {
            print("\n----Player \(player.id)----")
            for hero in player.team {
                print(hero.description)
            }
        }
    }
 
    // Ask player to choose a character of his team
    private func selectHero(_ player: Player) -> Character {
        
        // Will contains the selected hero
        var hero:           Character?
        
        // Boolean to check if the number enter by the player is valid
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
    
    // Check if character is still alive
    private func checkIfHeroIsAlive(_ player: Player, _ hero: inout Character?, i: Int) -> Bool {
        
        // Boolean to check if the number enter by the player is valid
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
    
    // Ask player to choose a target
    private func selectTarget(_ players: [Player], _ player: Player, _ hero: Character) {
    
        // Will contains the selected target
        var target:         Character?
        
        // Boolean to check if the number enter by the player is valid
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

    // Check if target is still alive
    private func checkIfTargetIsAlive(_ player: Player, _ hero: Character, _ target: inout Character?, i: Int) -> Bool {
   
        // Boolean to check if the number enter by the player is valid
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
    
    // Manage the different step of the fight
    func start() {
        
        // Contains hero selected by the player
        var hero:           Character
        
        // Round number
        var roundNumber = 0
        print(description)
        while  players.first!.isAlive && players.last!.isAlive {
            roundNumber += 1
            print("\n---- Round \(roundNumber) ----")
            for player in players {
                printTeams()
                hero = selectHero(player)

                // Random number between 0 and 1 (If 1 a treasure appear)
                let randomNum = Int(arc4random_uniform(2))
                if randomNum == 1 {
                    let treasure = Treasure()
                    print(treasure.description)
                    treasure.random_object(hero)
                }
                if hero.isAlive {
                    selectTarget(players, player, hero)
    
                }
                if !players.first!.isAlive || !players.last!.isAlive {
                    break
                }
            }
        }
        for player in players {
            if player.isAlive {
                print("🥇  Player \(player.id) has won in \(roundNumber) round !!!🥇")
            }
        }
    }
}
