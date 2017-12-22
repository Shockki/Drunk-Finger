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
    let superGame: SuperGame = SuperGame()
    
    
    @IBOutlet var gestureRec: UITapGestureRecognizer!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var viewSuperGame: UIView!
    @IBOutlet weak var buttonTrue: Button!
    @IBOutlet weak var buttonFalse: Button!
    @IBOutlet weak var labelSuperGame: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    let backColors: [UIColor] = [#colorLiteral(red: 0, green: 0.8881693865, blue: 1, alpha: 1), #colorLiteral(red: 0.001198597251, green: 0.890129283, blue: 0.1998577118, alpha: 1), #colorLiteral(red: 1, green: 0.6365509153, blue: 0.9711150977, alpha: 1), #colorLiteral(red: 0.2598219664, green: 0.4993801239, blue: 1, alpha: 1), #colorLiteral(red: 0.9871906726, green: 0.3625296618, blue: 0.3683782933, alpha: 1), #colorLiteral(red: 0.9818171003, green: 0.8430654574, blue: 0.05065612521, alpha: 1)]
//    var players: [String] = ["Миша", "Саша", "Коля", "Лиза"]
    var players: [String] = []
    var text: [String] = []
    var check: Bool = Bool()
    var score: Int = 0
    var timer = Timer()
    var time: Int = 15

    override func viewDidLoad() {
        super.viewDidLoad()
//        labelText.text! = data.beginningOfTheGame(players: players)
        gestureRec.isEnabled = false
        
        
        check = superGame.starSuperGame(label: labelSuperGame)
        labelTimer.text = "15"
        timerBack()
        print(score)
        
        
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
        print("lol")
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
//------------------------SuperGame-----------------------
    
    @IBAction func buttonTrue(_ sender: Any) {
        if check == true {
            score += 1
        }else{
            if score != 0 {
                score -= 1
            }
        }
        changeButtonPosition()
    }
    
    @IBAction func buttonFalse(_ sender: Any) {
        if check == false {
            score += 1
        }else{
            if score != 0 {
                score -= 1
            }
        }
        changeButtonPosition()
    }
    
    func changeButtonPosition() {
        check = superGame.starSuperGame(label: labelSuperGame)
        let button = UIButton()
        if score == 4 || score == 9{
            button.frame = buttonTrue.frame
            buttonTrue.frame = buttonFalse.frame
            buttonFalse.frame = button.frame
        }
        if score == 6 || score == 10 {
            button.frame = buttonTrue.frame
            buttonTrue.frame = buttonFalse.frame
            buttonFalse.frame = button.frame
        }
        labelScore.text = "\(score) из 15"
    }
    
    
    
    func timerBack()  {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TextViewController.action), userInfo: nil, repeats: true)
    }
    
    @objc func action() {
        time -= 1
        labelTimer.text = String(time)
        if time == 0 {
            timer.invalidate()
            buttonTrue.alpha = 0
            buttonFalse.alpha = 0
            if score < 15 {
                labelSuperGame.text = "Пей! Гы-Гы-Гы!"
            }else{
                labelSuperGame.text = "Красава!"
            }
        }
    }
    
}
