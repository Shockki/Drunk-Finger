//
//  SuperGamesViewController.swift
//  Drunk Finger
//
//  Created by Анатолий on 16.01.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import UIKit

class SuperGamesViewController: UIViewController {

    @IBOutlet weak var viewSuperGame: UIView!
    @IBOutlet weak var rules: UIView!
    @IBOutlet weak var textRules: UILabel!
    @IBOutlet weak var buttonStartSG: Button!
    @IBOutlet weak var buttonNextRules: Button!
    @IBOutlet weak var buttonTrue: Button!
    @IBOutlet weak var buttonFalse: Button!
    @IBOutlet weak var buttonNext: Button!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelSuperGame: UILabel!
    
    let dataSuperGames: DataSuperGames = DataSuperGames()
    
    var players: [String] = []
    var check: Bool = Bool()
    var score: Int = 0
    var timer = Timer()
    var time: Int = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(players)
        rules.alpha = 1
        viewSuperGame.alpha = 0
        textRules.text! = dataSuperGames.rules(players: players)[0]
    }

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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SuperGamesViewController.action), userInfo: nil, repeats: true)
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
//        viewSuperGame.alpha = 0
//        rules.alpha = 0
//        navigationController?.popViewController(animated: true)
    }

}
