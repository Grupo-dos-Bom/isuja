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
    

    @IBAction func increaseUsedTimes(sender: AnyObject) {
    }
    
    func setCloth (_ currentCloth: Cloth) {
        self.imageCell.image = UIImage(named: currentCloth.image)
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
