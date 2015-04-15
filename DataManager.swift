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
    
    
    
    func addCloth (_ name: String, _ image: String, _ type: Cloth.clothType) {
        let newCloth = Cloth (name,image,type)
        cleanClothes.append(newCloth)
    }
    func putInLaundry (_ index: Int) {
        dirtyClothes.append(cleanClothes[index])
        cleanClothes.removeAtIndex(index)
    }
    func washCloth (_ index: Int) {
        cleanClothes.append(cleanClothes[index])
        dirtyClothes.removeAtIndex(index)
    }
    func getCleanCloth (_ index: Int) -> Cloth {
        return cleanClothes[index]
    }
    func getDirtyCloth (_ index: Int) -> Cloth {
        return dirtyClothes[index]
    }
}