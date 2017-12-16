//
//  TableViewCell.swift
//  Drunk Finger
//
//  Created by Анатолий on 07.12.2017.
//  Copyright © 2017 Анатолий Модестов. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var playerField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("lol")
        return true
    }

}
