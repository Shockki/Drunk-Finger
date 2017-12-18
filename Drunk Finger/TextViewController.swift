//
//  TextViewController.swift
//  Drunk Finger
//
//  Created by Анатолий on 07.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    let data: Data = Data()
    
    @IBOutlet weak var labelText: UILabel!
    
    let backColors: [UIColor] = [#colorLiteral(red: 0, green: 0.8881693865, blue: 1, alpha: 1), #colorLiteral(red: 0.001198597251, green: 0.890129283, blue: 0.1998577118, alpha: 1), #colorLiteral(red: 1, green: 0.6365509153, blue: 0.9711150977, alpha: 1), #colorLiteral(red: 0.2598219664, green: 0.4993801239, blue: 1, alpha: 1), #colorLiteral(red: 0.9871906726, green: 0.3625296618, blue: 0.3683782933, alpha: 1), #colorLiteral(red: 0.9818171003, green: 0.8430654574, blue: 0.05065612521, alpha: 1)]
//    var players: [String] = ["Миша", "Саша", "Коля", "Лиза"]
    var players: [String] = []
    var text: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text! = data.beginningOfTheGame(players: players)
        
    }

    @IBAction func tapAction(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = self.backColors[self.data.randNum(self.backColors.count)]
        })
        labelText.alpha = 0
        labelText.frame = CGRect(x: labelText.frame.origin.x + 500, y: labelText.frame.origin.y, width: labelText.frame.size.width, height: labelText.frame.size.height)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.labelText.frame = CGRect(x: self.labelText.frame.origin.x - 500, y: self.labelText.frame.origin.y, width: self.labelText.frame.size.width, height: self.labelText.frame.size.height)
            self.labelText.alpha = 1
        })
        labelText.text! = data.returnText(players: players)
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
