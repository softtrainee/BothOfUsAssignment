//
//  EmployeeTableViewCell.swift
//  MVVM_New
//
//  Created by Abhilash Mathur on 20/05/20.
//  Copyright © 2020 Abhilash Mathur. All rights reserved.
//

import UIKit
 
class TableViewCell: UITableViewCell {
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    var obj : Allgemein? {
        didSet {
            IdLabel.text = "ID: \(obj?.id ?? "")"
            NameLabel.text = "Name: \(obj?.titel ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
