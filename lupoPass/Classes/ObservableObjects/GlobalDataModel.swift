//
//  GlobalDataModel.swift
//  lupoPass
//
//  Created by Roland Braun on 9/3/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import Foundation

class GlobalDataModel: ObservableObject {
    // An Object of this class holds an handles the passwords/logins etc.
    
    @Published var sampleItem = "sampleItem"
    
    private var listOfAllItems: [Item] {
        return readAllItems()
    }
    
    init() {
        //
    }
    
    private func readAllItems() -> [Item] {
        // Reads all stored items from database and return them as an array of [Items]
        var result: [Item] = []
        for i in 0...200 {
            result.append(Item(id: i, title: "Items #\(i)"))
        }
        return result
        
    }
    
    func getListOfAllItems() -> [Item] {
        return self.listOfAllItems
    }
}
