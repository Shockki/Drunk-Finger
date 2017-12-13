//
//  Data.swift
//  Drunk Finger
//
//  Created by Анатолий on 13.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

class Data {
    var textArray: [String] = ["text_0", "text_1", "text_2"]
    
    func text(name_0: String, name_1: String, numberText: Int) {
        let text_0: String = "bla bla \(name_0) bla bla \(name_1) bla bla"
        let text_1: String = "\(name_0) no no \(name_1) no no no"
        let text_2: String = "yes\(name_0) yes yes yes \(name_1)"

    }
}
