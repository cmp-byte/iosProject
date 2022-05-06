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
    private let infoLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 40, width: 400, height: 200))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        label.textAlignment = .center
        label.text = "Hello!\n As u might have observed , the app is full of mock data. Most of the  actual functionality is in the Bmi part\n here u can request to view the username of our tallest user and his height!\n Small use of a sorted by height select"
        label.textColor = .label
        return label
    }()
    
    private let showTallestUserButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 70, y: 320, width: 280, height: 40))
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setTitle ("Show tallest user button", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        return button
    }()
    
    private let tallestUserLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 60, y: 380, width: 400, height: 200))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        label.textAlignment = .left
        label.textColor = .label
        return label
    }()
    
    
    @objc private func didTapShowTallestUserButton() {
        let data = realm.objects(BmiProfile.self).sorted(byKeyPath: "height", ascending: false).first
        
        if let myEmail = data?.email {
            let usernameData = realm.objects(AccProfile.self).filter("email == '\(myEmail)'").first
            if let myUsername = usernameData?.username{
                if let myheight = data?.height{
                    tallestUserLabel.text = "Username:\(myUsername) \n Height: \(myheight)\n Email: \(myEmail) \n\n Keep in mind it's according to him!"
                }
        
            }}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(infoLabel)
        self.view.addSubview(showTallestUserButton)
        self.view.addSubview(tallestUserLabel)
            
        print("User Realm User file location: \(realm.configuration.fileURL!.path)")
    }
 
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showTallestUserButton.addTarget(self, action: #selector(didTapShowTallestUserButton), for: .touchUpInside)
    }


}


	
