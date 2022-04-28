//
//  DatabaseManager.swift
//  l
//
//  Created by user217575 on 4/26/22.
//

import FirebaseDatabase
import Foundation
public class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    /// Check if username and email si available
    /// -Parameters
    ///     -email:String representing email
    ///     -username: String representing username
    ///     
    public func canCreateNewUser(with email: String, username: String ,  completion: (Bool)-> Void){
        completion(true)
    }
    /// Inserts new users data to databse
    /// -Parameters
    ///     -email:String representing email
    ///     -username: String representing username
    ///     -completion:Async callback for result if db entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void ){
        database.child(email.safeDatabaseKey()).setValue(["username": username]){ error, _ in
            if error == nil{
                //succes
                completion(true)
            }
            else{
                //failure
                completion(false)
                return
            }
        }
        
    }

}
