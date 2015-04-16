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
    var type: clothType
    
    enum clothType {
        case trousers, shirt, underwearF, underwearM
    }

    
    init (name:String, image:String, type: clothType) {
        self.name = name
        self.image = image
        self.type = type
    }
    
    func increaseUsedTimes() {
        self.usedTimes++;
    }
    
    func washCloth () {
        self.usedTimes = 0;
    }
    
}
