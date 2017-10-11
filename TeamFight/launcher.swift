//
//  launcher.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

class Launcher {
    
    // List of the different players
    var players: [Player] = []
    
    // Description of the game
    private func description() {
        print("Welcome to TeamFight !!!\n"
            + "Each team will be composed by 3 fighters and fight until death 💀\n"
            + "Ready !? \n")
    }
    
    // Initialization of the player's team
    private func initTeam(_ player: Player) {
        player.createTeam(players)
        players.append(player)
    }
    
    // Func to call to play game
    func play() {
        description()
        for i in 1...2 {
            let player = Player()
            player.id = i
            print("\nPlayer \(i) choose your heroes !!!")
            initTeam(player)
        }
        let fight = Fight(players)
        fight.start()
    }
}
