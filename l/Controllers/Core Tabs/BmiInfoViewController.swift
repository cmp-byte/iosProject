//
//  CameraViewController.swift
//  l
//
//  Created by user217575 on 4/25/22.
//

import AVFoundation
import AVKit
import UIKit
import RealmSwift

class CameraViewController: UIViewController, UNUserNotificationCenterDelegate {
    let realm = try! Realm()
    private let infoLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 90, width: 400, height: 200))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        label.textAlignment = .center
        label.text = "Hello!\n As u might have observed , the app is full of mock data. Most of the  actual functionality is in the Bmi part\n here u can request to view the username of our tallest user and his height!\n Small use of a sorted by height select"
        label.backgroundColor = .secondarySystemBackground
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
    
    let center = UNUserNotificationCenter.current()
        func Auth () {
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
        }
    
    func notify(){
           
              let content = UNMutableNotificationContent()
              content.title = "Hey i'm your friendly local notif"
              content.body = "Have you tried our BMI calculator yet? Second view controller, check it out!"
         
          
              let date = Date().addingTimeInterval(5)
              
              let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
              
              let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
              
              // Step 4: Create the request
              
              let uuidString = UUID().uuidString
              
              let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
              
              // Step 5: Register the request
              center.add(request) { (error) in
                  print(error)
                  // Check the error parameter and handle any errors
              }
           
       }

    
    override func viewWillAppear(_ animated: Bool){
           super.viewWillAppear(animated)
               self.center.delegate = self
               self.Auth()
               self.notify()
            
           }
    
    
    
    override func viewDidLoad() {
   
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "tall", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: 0, y: tallestUserLabel.bottom+10, width: view.width, height: view.height/6)
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
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
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
          completionHandler()
      }

      func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
          completionHandler([.alert, .badge, .sound])
      }

    
}


	

