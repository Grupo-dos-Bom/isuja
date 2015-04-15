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
    func putInLaundry (_ row: Int) {
        dirtyClothes.append(cleanClothes[row])
        cleanClothes.removeAtIndex(row)
    }
    func washCloth (_ row: Int) {
        cleanClothes.append(cleanClothes[row])
        dirtyClothes.removeAtIndex(row)
    }
    func getCleanCloth (_ row: Int) -> Cloth {
        return cleanClothes[row]
    }
    func getDirtyCloth (_ row: Int) -> Cloth {
        return dirtyClothes[row]
    }
}