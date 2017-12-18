//
//  ViewController.swift
//  Drunk Finger
//
//  Created by Анатолий on 07.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableAddPlayers: UITableView!
    @IBOutlet weak var labelNotLess: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var warning: View!
    
    var players: [String] = []
    var pPp: [String] = []
    var number = 1
    var playersCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        background.alpha = 1
        warning.alpha = 1
        tableAddPlayers.allowsSelection = false
        labelNotLess.alpha = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        number = 1
        players.removeAll()
        pPp.removeAll()
        tableAddPlayers.reloadData()
    }
    
    @IBAction func buttonAddPlayers(_ sender: Any) {
        playersCount += 1
        number = 1
        tableAddPlayers.numberOfRows(inSection: playersCount)
        reloadTable()
        UIView.animate(withDuration: 0.3, animations: {
            self.tableAddPlayers.reloadData()
        })
    }
    
    @IBAction func buttonGo(_ sender: Any) {
            number = 1
            tableAddPlayers.reloadData()
            reloadTable()
        if players.count < 3 {
            labelNotLess.alpha = 1
            labelNotLess.transform = CGAffineTransform(scaleX: 0.3, y: 2)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.labelNotLess.transform = .identity
            })
            print("< 3 - \(players)")
        }else{
            labelNotLess.alpha = 0
            performSegue(withIdentifier: "goText", sender: self)
            print("norm - \(players)")
        }
    }
    
    func reloadTable() {
        for p in pPp {
            if players.isEmpty {
                players.append(p)
            } else {
                var check: Bool = false
                for player in players {
                    if p == player {
                        check = true
                    }
                }
                if check == false {
                    players.append(p)
                }
            }
        }
    }
    @IBAction func buttonWarningNext(_ sender: Any) {
        UIView.animate(withDuration: 0.4, animations: {
            self.background.alpha = 0
            self.warning.alpha = 0
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        number = 1
        tableAddPlayers.reloadData()
        reloadTable()
        self.view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableAddPlayers.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.layer.cornerRadius = 23
        cell.playerField.leftView = UIView(frame: .init(x: 0, y: 0, width: 8, height: 0))
        cell.playerField.leftViewMode = .always
        cell.playerField.placeholder = "Игрок " + String(number)
        number += 1
        
        if cell.playerField.text! != "" {
            pPp.append(cell.playerField.text!)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goText" {
            let destVC: TextViewController = segue.destination as! TextViewController
            for player in players {
                destVC.players.append(player)
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }



}

