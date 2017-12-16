//
//  ViewController.swift
//  Drunk Finger
//
//  Created by Анатолий on 07.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableAddPlayers: UITableView!
    
    var players: [String] = []
    var pPp: [String] = []
    var number = 1
    var playersCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        tableAddPlayers.allowsSelection = false
        
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
//        print("button")
//        performSegue(withIdentifier: "goText", sender: self)
        print("Button - \(players)")

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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        cell.playerField.placeholder = "Игрок " + String(number)
        number += 1
        
        if cell.playerField.text! != "" {
            pPp.append(cell.playerField.text!)
        }
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
//        print("CellPlayers - \(players)")
//        print("Cell - \(pPp)")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goText" {
            let destVC: TextViewController = segue.destination as! TextViewController
            for player in players {
                destVC.players.append(player)
            }
        }
        print("prepare for segue")
    }



}

