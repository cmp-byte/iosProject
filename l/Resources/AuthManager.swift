//
//  AuthManager.swift
//  l
//
//  Created by user217575 on 4/26/22.
//
import FirebaseAuth
import Foundation

public class AuthManager{
    
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         check username availb
         check email availb
         create acc
         insert acc to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) {canCreate in
            if canCreate {
                /*
                 --create acc
                 -- insert acc to databse
                 */
                Auth.auth().createUser(withEmail: email, password: password){ result , error in
                    guard error == nil, result != nil else {
                        //firebase auth could not create acc
                        completion(false)
                        return
                        
                    }
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted{
                            completion(true)
                            return
                        }
                        else {
                            //failed insert to db
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email { //email log in
          
            Auth.auth().signIn(withEmail: email, password: password){authResult, error in
                guard authResult != nil , error == nil else{
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username {//username log in
            print(username)
            
        }
    }
    //attempt to log out user via firebase
    public func logOut (completion: (Bool) -> Void){
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch{
            print(error)
            completion(false)
            return
        }
    }
}
