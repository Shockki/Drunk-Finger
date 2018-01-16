//
//  SuperGame.swift
//  Drunk Finger
//
//  Created by Анатолий on 21.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class DataSuperGames {
    let textColor: [UIColor] = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9884993655, green: 0.9789566089, blue: 0, alpha: 1)]
    let colorName: [String] = ["Синий", "Красный", "Зеленый", "Жёлтый"]
    
    func randNum(_ n: Int) -> Int{
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    func rules(players: [String]) -> [String] {
        let randPlayer = players[randNum(players.count)]
        let text: [String] = ["\(randPlayer), ты делаешь любую ставку на алкоголе (пример: 3 глотка, 5 глотков, пол стакана). Если ты проигрываешь - пьёшь ты, если выигрываешь - пью все остальные.",
            "На экране будет появляться слова с наименованием цветов, каждое слово будет окрашиваться в любой рандомный цвет. При совпадении или не совпадении названия цвета и цвета самого слова - выбираешь один из предоставленных вариантов ответа (верно или не верно). За 15 секунд тебе надо дать минимум 15 правильных ответов, но за каждый неправильный ответ будет вычитаться 1 балл."]
        return text
    }
    
    
    
    func startSuperGame(label: UILabel) -> Bool {
        var check: Bool = Bool()
        let numbTC: Int = randNum(textColor.count)
        let numbCN: Int = randNum(colorName.count)
        label.text = colorName[numbTC]
        label.textColor = textColor[numbCN]
        if numbTC == numbCN {
            check = true
        }else{
            check = false
        }
        return check
    }
    
}

