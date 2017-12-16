//
//  Button.swift
//  Drunk Finger
//
//  Created by Анатолий on 15.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

@IBDesignable class Button: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
