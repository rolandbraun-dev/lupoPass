//
//  Item.swift
//  lupoPass
//
//  Created by Roland Braun on 9/3/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import Foundation

class Item {
    
    var id: Int
    var title: String
    var username: String?
    var password: String?
    var email: String?
    var website: String?
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
}
