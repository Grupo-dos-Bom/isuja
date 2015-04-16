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
    var cleanClothes:[Cloth] = []
    var dirtyClothes:[Cloth] = []

    class var sharedInstance: DataManager {
        return _DataManagerSharedInstance
    }
    
    
    
    func addCloth (name: String, _ image: String, _ type: Cloth.clothType) {
        let newCloth = Cloth(name: name, image: image, type: type)
        cleanClothes.append(newCloth)
    }
    func putInLaundry (index: Int) {
        dirtyClothes.append(cleanClothes[index])
        cleanClothes.removeAtIndex(index)
    }
    func washCloth (index: Int) {
        dirtyClothes[index].washCloth()
        cleanClothes.append(dirtyClothes[index])
        dirtyClothes.removeAtIndex(index)
    }
    func getCleanCloth (index: Int) -> Cloth {
        return cleanClothes[index]
    }
    func getDirtyCloth (index: Int) -> Cloth {
        return dirtyClothes[index]
    }
}