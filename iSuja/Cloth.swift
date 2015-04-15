//
//  Cloth.swift
//  iSuja
//
//  Created by Diego Silva de Carvalho on 15/04/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import Foundation

class Cloth {
    var name: String
    var image: String
    var usedTimes = 0
    
    init (name:String, image:String, usedTimes:Int) {
        self.name = name
        self.image = image
        self.usedTimes = usedTimes
    }
    
    func increaseUsedTimes() {
        self.usedTimes++;
    }
    
}
