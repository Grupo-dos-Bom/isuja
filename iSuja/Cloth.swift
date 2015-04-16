//
//  Cloth.swift
//  iSuja
//
//  Created by Diego Silva de Carvalho on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import UIKit

class Cloth {
    var name: String
    var image: String
    var color: UIColor
    var usedTimes = 0
    var type: clothType
    
    enum clothType {
        case trousers, shirt, socks
    }

    
    init (name:String, image:String, type: clothType, color: UIColor) {
        self.name = name
        self.image = image
        self.type = type
        self.color = color
    }
    
    func increaseUsedTimes() {
        self.usedTimes++;
    }
    
    func washCloth () {
        self.usedTimes = 0;
    }
    
}
