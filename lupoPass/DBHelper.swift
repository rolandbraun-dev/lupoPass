//
//  DBHelper.swift
//  lupoPass
//
//  Created by Roland Braun on 9/7/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import Foundation
import SQLite3

class DBHelper {
    
    var db: OpaquePointer?
    var path = "mydb.sqlite"
    
    init() {
        self.db = createDatabase()
    }
    
    func createDatabase() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Error creating Database")
            return nil
        } else {
            print("Database has been created with path \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS grade(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, result TEXT, list TEXT);"
        var createTable: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Table created")
            }
        } else {
            print("Table NOT created")
        }
    }
    
}
