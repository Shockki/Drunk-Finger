//
//  Data.swift
//  Drunk Finger
//
//  Created by Анатолий on 13.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//
import Foundation

class Data {
    private var name_0: String = ""
    private var name_1: String = ""
    private var name_2: String = ""
    private var textArray: [String] = []
    
    func text(_ name_0: String,_ name_1: String,_ name_2: String) {
        let textArray: [String] = [
            "bla bla \(name_0) bla bla \(name_1) bla bla",
            "\(name_0) no no \(name_1) no no no",
            "yes \(name_0) yes yes yes \(name_1)",
            "kek kek \(name_0) kek \(name_1) kek kek kek \(name_2)"
        ]
        //        text = textArray
    }
    
    private func randNum(_ n: Int) -> Int{
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    private func playerRandom(_ player: [String]) {
        let num0 = randNum(player.count)
        var num1 = randNum(player.count)
        var num2 = randNum(player.count)
        while num0 == num1{
            num1 = randNum(player.count)
        }
        while num2 == num0 || num2 == num1 {
            num2 = randNum(player.count)
        }
        name_0 = player[num0]
        name_1 = player[num1]
        name_2 = player[num2]
        print(name_0, name_1, name_2)
    }
    
    func returnText(players: [String], tx: [String]) -> String {
        playerRandom(players)
        var t: String = ""
        if tx.isEmpty {
            print("Empty")
            text(name_0, name_1, name_2)
        } else {
            
        }
        return t
    }
    
    
}
