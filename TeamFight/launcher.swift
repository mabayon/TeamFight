//
//  launcher.swift
//  TeamFight
//
//  Created by Mahieu Bayon on 21/09/2017.
//  Copyright © 2017 Mahieu Bayon. All rights reserved.
//

import Foundation

class Launcher {
    var players: [Player] = []
    
    private func description() {
        print("Welcome to TeamFight !!!\n"
            + "Each team will be composed by 3 fighters and fight until death 💀\n"
            + "Ready !? \n")
    }
    private func initTeam(_ player: Player) {
        player.createTeam(players)
        players.append(player)
    }
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
