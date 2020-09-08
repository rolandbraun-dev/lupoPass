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
    
   func insert( name: String, result: String, list: String) {
        let query = "INSERT INTO grade (id, name, result, list) VALUES (?, ?, ?, ?);"
        
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, 1)
            sqlite3_bind_text(statement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (result as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (list as NSString).utf8String, -1, nil)
            print("Inserted data to database")
        } else {
            print("Query is not as per requirement")
        }
    }
    
    func read(id: Int) -> String {
        let query = "SELECT * from grade;"
        var statement: OpaquePointer? = nil
        var returnString = "..."
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let name = String(describing: sqlite3_column_text(statement, 1))
                returnString += "\(id) - \(name)\n"
            }
        }
        return returnString
    }
    
}
