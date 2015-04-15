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
    var cleanClothes:[String] = []
    var dirtyClothes:[String] = ["Cueca cinza", "Meia branca", "Camiseta verde escuro"]
    class var sharedInstance: DataManager {
        return _DataManagerSharedInstance
    }
}