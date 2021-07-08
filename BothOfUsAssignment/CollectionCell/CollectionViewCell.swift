//
//  CollectionViewCell.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

import UIKit

extension UILabel {
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!{
        didSet{
            NameLabel.textDropShadow()
        }
    }
    
    var name : String? {
        didSet {
            NameLabel.text = name
        }
    }
    
    var img : String? {
        didSet {
            imgView.image = UIImage.init(named: img ?? "")
        }
    }
}
