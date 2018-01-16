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
    let dataSuperGames: DataSuperGames = DataSuperGames()
    
    @IBOutlet var gestureRec: UITapGestureRecognizer!
    @IBOutlet var gestureSG: UITapGestureRecognizer!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var viewSuperGame: UIView!
    @IBOutlet weak var rules: UIView!
    @IBOutlet weak var textRules: UILabel!
    @IBOutlet weak var buttonNextRules: Button!
    @IBOutlet weak var buttonStartSG: Button!
    @IBOutlet weak var buttonNext: Button!
    
    @IBOutlet weak var buttonTrue: Button!
    @IBOutlet weak var buttonFalse: Button!
    @IBOutlet weak var labelSuperGame: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    let backColors: [UIColor] = [#colorLiteral(red: 0, green: 0.776584654, blue: 0.8743654823, alpha: 1), #colorLiteral(red: 0.001281706249, green: 0.7401848033, blue: 0.1860074805, alpha: 1), #colorLiteral(red: 0.8324079949, green: 0.5268384427, blue: 0.8114537006, alpha: 1), #colorLiteral(red: 0.2598219664, green: 0.4993801239, blue: 1, alpha: 1), #colorLiteral(red: 0.8441465736, green: 0.3226962472, blue: 0.3305995261, alpha: 1), #colorLiteral(red: 0.8609018085, green: 0.7357219774, blue: 0.06335742704, alpha: 1)]
//    var players: [String] = ["Миша", "Саша", "Коля", "Лиза"]
    var players: [String] = []
    var text: [String] = []
    var check: Bool = Bool()
    var score: Int = 0
    var timer = Timer()
    var time: Int = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSuperGame.alpha = 0
        rules.alpha = 0
        labelText.text! = data.beginningOfTheGame(players: players)
    }

    @IBAction func tapAction(_ sender: Any) {
        if  data.countText().count % 10 == 0 {
            gestureRec.isEnabled = false
            viewSuperGame.alpha = 0
            rules.alpha = 1
            buttonNextRules.alpha = 1
            buttonStartSG.alpha = 0
            time = 15
            score = 0
            textRules.text! = dataSuperGames.rules(players: players)[0]
        }else{
            animateLabel()
        }
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
//------------------------SuperGame-----------------------
    
    
    @IBAction func buttonNextRules(_ sender: Any) {
        textRules.text! = dataSuperGames.rules(players: players)[1]
        buttonNextRules.alpha = 0
        buttonStartSG.alpha = 1
        
    }
    @IBAction func buttonStartSG(_ sender: Any) {
        rules.alpha = 0
        viewSuperGame.alpha = 1
        buttonTrue.alpha = 1
        buttonFalse.alpha = 1
        buttonNext.alpha = 0
        labelTimer.text = "15"
        check = dataSuperGames.startSuperGame(label: labelSuperGame)
        timerBack()
    }
    
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
        check = dataSuperGames.startSuperGame(label: labelSuperGame)
        let button = UIButton()
        if score == 4 || score == 6 || score == 9 || score == 10{
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
            buttonNext.alpha = 1
            if score < 15 {
                labelSuperGame.text = "\(score) из 15\n Пей!\n Гы-Гы-Гы!"
            }else{
                labelSuperGame.text = "\(score) из 15\n Красава!"
            }
        }
    }
    @IBAction func buttonNext(_ sender: Any) {
        viewSuperGame.alpha = 0
        rules.alpha = 0
        gestureRec.isEnabled = true
        animateLabel()
    }
    
//------------------------------------------------------
    
    func animateLabel() {
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
    
}
