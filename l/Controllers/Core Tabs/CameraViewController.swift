//
//  CameraViewController.swift
//  l
//
//  Created by user217575 on 4/25/22.
//

import AVFoundation
import UIKit
import RealmSwift

class CameraViewController: UIViewController {
    let realm = try! Realm()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
               //self.write()
                //self.read()
               // self.update()
               // self.read()
                //self.delete()
        print("User Realm User file location: \(realm.configuration.fileURL!.path)")
    }
 
    /*
 
 
 
 
 
 
 
 
    private func write() {
        let profile3 = Profile.create(withName: "okCevaNoua", username:"dsadas", bio: " mare cring da da merge fortnite ari ")
        let profile4 = Profile.create(withName: "VanouOiBa", username:"sdfsd", bio: " mediu cring miediiu pepa pigg ")

        print("Write to Realm")
            try! realm.write {
                realm.add(profile3)
                realm.add(profile4)
                

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
         let tableToDelete = realm.objects(Profile.self)
        print("Before   ")
        print(tableToDelete)
        try! realm.write {
            realm.delete(tableToDelete)
        }
        
        print(realm.objects(Profile.self).first)
        }
*/
        
    private func didTapTakePicture(){
        
    }

}


	
