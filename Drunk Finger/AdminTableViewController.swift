//
//  AdminTableViewController.swift
//  Drunk Finger
//
//  Created by Анатолий on 16.01.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import UIKit

class AdminTableViewController: UITableViewController {

    let data: Data = Data()
    
    let players = ["Игрок"]
    
    
    @IBOutlet weak var countQuestions: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countQuestions.isSelected = false
        countQuestions.detailTextLabel?.text = String(data.countQuestions())
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSG" {
            let destVC: SuperGamesViewController = segue.destination as! SuperGamesViewController
            destVC.players = players
        }
    }

}
