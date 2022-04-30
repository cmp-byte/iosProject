//
//  SettingsViewController.swift
//  l
//
//  Created by user217575 on 4/26/22.
//
import SafariServices
import UIKit


struct SettingCellModel{
    let title: String
    let handler: (() -> Void)
}

//view controller for settings
final class SettingsViewController: UIViewController {

   
        private let tableView: UITableView = {
            let tableView = UITableView(frame: .zero,
                                        style: .grouped)
            tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "cell")
            return tableView
            
        }()
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

    }
    
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         tableView.frame = view.bounds
    }
    
    private func configureModels(){
        data.append ([
            SettingCellModel(title: "Edit profile"){[weak self] in
                self?.didTapEditProfile()
             
            },
            SettingCellModel(title: "Invite friends"){[weak self] in
                self?.didTapInviteFriends()
            },
            SettingCellModel(title: "Save original posts"){[weak self] in
                self?.didTapSaveOriginalPosts()
            }
        ])
        
        data.append ([
            SettingCellModel(title: "Terms of service"){[weak self] in
                self?.openURL(type: .terms)
            },
            SettingCellModel(title: "Privacy policy"){[weak self] in
                self?.openURL(type: .privacy)
            },
            SettingCellModel(title: "Help /Feedback"){[weak self] in
                self?.openURL(type: .help)
            }
        ])
        
        data.append ([
            SettingCellModel(title: "Log out"){[weak self] in
                self?.didTapLogOut()
            }
        ])
        
    }
    enum SettingsURLType{
        case terms, privacy, help
    }
    
    private func openURL(type: SettingsURLType){
        let urlString: String
        switch type{
        case .terms: urlString = "https://www.google.com/"
        case .privacy: urlString = "https://www.google.com/"
        case .help: urlString = "https://www.google.com/"
        }
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends(){
        //show share sheet in order to inv friends
    }
    
    private func didTapSaveOriginalPosts(){
        
    }
    
    private func didTapLogOut(){
        let actionSheet = UIAlertController(title: "Log out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(completion: {success in
                DispatchQueue.main.async {
                    if success {
                        //present log in
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else{
                        //error
                        fatalError("Could not log out")
                    }
                }
            })
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        
        present(actionSheet, animated: true)
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data [indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
    
}
