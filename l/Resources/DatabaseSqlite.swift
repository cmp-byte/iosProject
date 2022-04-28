//
//  DatabaseSqlite.swift
//  l
//
//  Created by user217575 on 4/27/22.
//

import Foundation
import SQLite3

class DatabaseSqlite {
    var db: OpaquePointer?
    var path : String = "myDb.sqlite"
    init(){
        self.db = createDB()
        self.createTable()
        
    }
    
    func createDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            print("error creating db")
            return nil
        }
        else{
            print("DB created with path \(path)")
            return db
        }
    }
    func createTable() {
        let query = "create table if not exists grade(id integer primary key autoincrement, username text, email text, password text);"
        
        var createTable : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1 ,&createTable, nil) == SQLITE_OK{
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("tabel created successfully")
            }
            
        
        else{
            print ("Table creation failed")
        }
    }
        else{
            print("Prep failed")
        }
    }
    
}
