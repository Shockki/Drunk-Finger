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
//    private var texts: [String] = []
    
    func allTexts(_ name_0: String,_ name_1: String,_ name_2: String) -> [String]{
        let textArray: [String] = [
            "1. bla bla \(name_0) bla bla \(name_1) bla bla",
            "2. \(name_0) no no \(name_1) no no no",
            "3. yes \(name_0) yes yes yes \(name_1)",
            "4. kek kek \(name_0) kek \(name_1) kek kek kek \(name_2)"
        ]
//        texts = textArray
        return textArray
    }
    
    func randNum(_ n: Int) -> Int{
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
    
    private func returnAllTexts() -> String {
        var texts = allTexts(name_0, name_1, name_2)
        return texts[randNum(texts.count)]
    }
    
    func returnText(players: [String]) -> String {
        playerRandom(players)
        var texts = allTexts(name_0, name_1, name_2)
        return texts[randNum(texts.count)]
    }
}
