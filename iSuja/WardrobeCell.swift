//
//  WardrobeCell.swift
//  iSuja
//
//  Created by Diego Silva de Carvalho on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class WardrobeCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usedTimesLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    var cellCloth: Cloth?
    
    enum buttonStyle {
        case add, removeCell
    }
    
    @IBAction func increaseUsedTimes(sender: AnyObject) {

        cellCloth?.increaseUsedTimes()
        let n = (cellCloth?.usedTimes)
        if (n != nil) {
        self.usedTimesLabel.text = String(n!)
        }
    }
    
    
    
    func setCloth (currentCloth: Cloth) {
        self.cellCloth = currentCloth
        self.imageCell.image = UIImage(named: currentCloth.image)
        self.imageCell.backgroundColor = currentCloth.color
        self.nameLabel.text = currentCloth.name
        self.usedTimesLabel.text = String(currentCloth.usedTimes)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
