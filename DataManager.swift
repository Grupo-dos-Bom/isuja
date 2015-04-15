//
//  DataManager.swift
//  iSuja
//
//  Created by Susin Matheus on 4/14/15.
//  Copyright (c) 2015 Grupo dos Bom. All rights reserved.
//

import Foundation

private let _DataManagerSharedInstance = DataManager()



class DataManager {
    var arrayClothes:[Cloth] = []
    var cleanClothes:[String] = []
    var dirtyClothes:[String] = ["Cueca cinza", "Meia branca", "Camiseta verde escuro"]
    class var sharedInstance: DataManager {
        return _DataManagerSharedInstance
    }
    
    
    
    func addCloth (name: String, image: String, usedTimes: Int, type: Cloth.clothType) {
        let newCloth = Cloth (name: name, image: image, usedTimes: usedTimes, type: type)
        arrayClothes.append(newCloth)
    }
}