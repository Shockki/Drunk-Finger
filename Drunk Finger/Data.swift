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
    private var count: [Int] = []
    
    private func allTexts(_ name_0: String,_ name_1: String,_ name_2: String) -> [String]{
        let textArray: [String] = [
            "\(name_0), каждый раз, когда ты будешь хлопать в ладоши, все будут пить (даже ты)",
            "Музыканты делают 3 глотка!",
            "\(name_0), каждый раз, когда один игрок говорит другому, сколько делать глотков, ты можешь добавлять любое количество глотков",
            "\(name_0), изобрази индюка на протяжении 5 секунд или делай 2 глотка",
            "\(name_0), закрой глаза и скажи какого цвета носки у \(name_1) или делай 3 глотка",
            "Сделай 3 глотка, если тебе снились эротические сны на этой неделе",
            "\(name_0), ты должен говорить с немецким акцентом или пей 5 глотков",
            "Каждый по очереди должен назвать песню Аллы Пугачевой, первый кто запнется или повторится делает 3 глотка, \(name_0) начинает",
            "\(name_0), это фиаско братан! Делай 3 глотка",
            "\(name_0), делаешь 2 глотка и приседаешь 6 раз",
            "Каждый по очереди должен назвать имя хоббита из трилогии «Хоббит», первый кто запнется или повторится делает 3 глотка, \(name_0) начинает",
        ]
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
    
    func beginningOfTheGame(players: [String]) -> String {
        count.removeAll()
        playerRandom(players)
        var text = allTexts(name_0, name_1, name_2)
        let numbRand = randNum(text.count)
        count.append(numbRand)
        return text[numbRand]
    }
    
    func returnText(players: [String]) -> String {
        playerRandom(players)
        var text = allTexts(name_0, name_1, name_2)
        var numbRand = randNum(text.count)
        var check: Bool = false
        for number in count {
            if number == numbRand{
                check = true
            }
        }
        if count.count != text.count {
            while check == true {
                check = false
                numbRand = randNum(text.count)
                for number in count {
                    if number == numbRand{
                        check = true
                    }
                }
            }
            count.append(numbRand)
            return text[numbRand]
        }else{
            return "The End:)"
        }
    }
}
