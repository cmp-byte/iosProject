//
//  Realm_DB.swift
//  l
//
//  Created by user217575 on 5/3/22.
//

import RealmSwift

let realm = try!Realm()

class Profile: Object {
    @objc dynamic var name = ""
    @objc dynamic var username = ""
    @objc dynamic var bio = ""
    
    static func create(withName name: String, username: String, bio: String) -> Profile {
        let profile = Profile()
        profile.name = name
        profile.username = name
        profile.bio = name
        
        return profile
    }
}



private func write() {
    let profile1 = Profile.create(withName: "jerseu", username:"rateu", bio: " mare cring da da merge fortnite ari ")
    let profile2 = Profile.create(withName: "maiou", username:"castou", bio: " mediu cring miediiu pepa pigg ")

    print("Write to Realm")
        try! realm.write {
            realm.add(profile1)
            realm.add(profile2)
            

        }
    }


private func read() {
    // Read from Realm
    print("Read from Realm")
    let data = realm.objects(Profile.self)
    print(data)
}


private func update() {
    // Update data
    if let table = realm.objects(Profile.self).first {
        try! realm.write {
            table.name = "New Table Name"
        }

        print(realm.objects(Profile.self).first)
    }
}

private func delete() {
    // Delete data
    print("Delete Data")
    if let tableToDelete = realm.objects(Profile.self).first {
        try! realm.write {
            realm.delete(tableToDelete)
        }

        print(realm.objects(Profile.self).first)
        
    }
}


