//
//  SuperGame.swift
//  Drunk Finger
//
//  Created by Анатолий on 21.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class SuperGame {
    let textColor: [UIColor] = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9884993655, green: 0.9789566089, blue: 0, alpha: 1)]
    let colorName: [String] = ["Синий", "Красный", "Зеленый", "Жёлтый"]
    
    func randNum(_ n: Int) -> Int{
        return Int(arc4random_uniform(UInt32(n)))
    }
    

    
    func starSuperGame(label: UILabel) -> Bool {
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
