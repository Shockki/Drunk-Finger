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
    
    let backColors: [UIColor] = [#colorLiteral(red: 0, green: 0.776584654, blue: 0.8743654823, alpha: 1), #colorLiteral(red: 0.001281706249, green: 0.7401848033, blue: 0.1860074805, alpha: 1), #colorLiteral(red: 0.8324079949, green: 0.5268384427, blue: 0.8114537006, alpha: 1), #colorLiteral(red: 0.2598219664, green: 0.4993801239, blue: 1, alpha: 1), #colorLiteral(red: 0.8441465736, green: 0.3226962472, blue: 0.3305995261, alpha: 1), #colorLiteral(red: 0.8609018085, green: 0.7357219774, blue: 0.06335742704, alpha: 1)]
    var players: [String] = ["Миша", "Саша", "Коля", "Лиза"]
//    var players: [String] = []
    var text: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text! = data.beginningOfTheGame(players: players)
    }

    @IBAction func tapAction(_ sender: Any) {
        if  data.countText().count % 10 == 0 {
            performSegue(withIdentifier: "superGames", sender: self)
        }else{
            animateLabel()
        }
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "superGames" {
            let destVC: SuperGamesViewController = segue.destination as! SuperGamesViewController
            destVC.players = players
        }
    }
}
