//
//  player.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

class Player {
    var id = 0
    var team: [Character] = []

    var isAlive: Bool {
        for hero in team {
            if hero.isAlive {
                return true
            }
        }
        return false
    }
    
    private func chooseYourCharacters(_ players: [Player]) {
        
        var validNumber: Bool
        
        for i in 1...3 {
            repeat {
                print("\nCharacter nº\(String(i)): Choose your class\n"
                    + " 1. Warrior 🗡   2. Mage ⚡️  3. Colossus 🔨  4. Dwarf ⛏\n")
                
                validNumber = true
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        let faction = Warrior()
                        faction.id = i
                        chooseYourName(players, hero: faction)
                    case "2":
                        let faction = Mage()
                        faction.id = i
                        chooseYourName(players, hero: faction)
                    case "3":
                        let faction = Colossus()
                        faction.id = i
                        chooseYourName(players, hero: faction)
                    case "4":
                        let faction = Dwarf()
                        faction.id = i
                        chooseYourName(players, hero: faction)
                    default:
                        print("\n❌  Enter a number between 1 and 4\n")
                        validNumber = false
                    }
                }
            } while !validNumber
        }
    }
    private func chooseYourName(_ players: [Player], hero: Character) {
        var validName: Bool
        
        repeat {
            print("Choose a name for your hero:")
            validName = true
            if let choice = readLine() {
                if team.isEmpty && players.isEmpty {
                    hero.name = choice
                    team.append(hero)
                }
                else {
                    for hero in team {
                        if choice == hero.name! {
                            validName = false
                            break
                        }
                    }
                    for player in players {
                        for hero in player.team {
                            if choice == hero.name! {
                                validName = false
                                break
                            }
                        }
                    }
                    if validName {
                        hero.name = choice
                        team.append(hero)
                    }
                    else {
                        print("\n❌  Name already taken")
                    }
                }
            }
        } while !validName
    }
    func createTeam(_ players: [Player]) {
        chooseYourCharacters(players)
    }
}
