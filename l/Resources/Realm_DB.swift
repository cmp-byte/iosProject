//
//  Realm_DB.swift
//  l
//
//  Created by user217575 on 5/3/22.
//

import RealmSwift

class Profile: Object {
    @objc dynamic var email = ""
    @objc dynamic var name = ""
    @objc dynamic var username = ""
    @objc dynamic var bio = ""
    
    override static func primaryKey() -> String? {
      return "email"
    }
    
    static func create(withName name: String, username: String, bio: String, email: String) -> Profile {
        let profile = Profile()
        profile.name = name
        profile.username = name
        profile.bio = name
        profile.email = email
        
        return profile
    }
}



