//
//  Realm_DB.swift
//  l
//
//  Created by user217575 on 5/3/22.
//

import RealmSwift

class BmiProfile: Object {
    @objc dynamic var email = ""
    @objc dynamic var age = ""
    @objc dynamic var height = ""
    @objc dynamic var weight = ""
    
    override static func primaryKey() -> String? {
      return "email"
    }
    
    static func create(withName age: String, height: String, weight: String, email: String) -> BmiProfile {
        let profile = BmiProfile()
        profile.age = age
        profile.height = height
        profile.weight = weight
        profile.email = email
        
        return profile
    }
}


class AccProfile: Object {
    @objc dynamic var email = ""
    @objc dynamic var username = ""
    
    override static func primaryKey() -> String? {
      return "email"
    }
    
    static func create(withName username: String,  email: String) -> AccProfile {
        let profile = AccProfile()
        profile.email = email
        profile.username = username
        
        return profile
    }
}
