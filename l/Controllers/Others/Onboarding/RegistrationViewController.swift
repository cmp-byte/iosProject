//
//  RegistrationViewController.swift
//  l
//
//  Created by user217575 on 4/25/22.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {
    
    struct Constants{
        static let cornerRadius: CGFloat = 8.0
    }
    
    let realm = try! Realm()
    
    private let usernameField: UITextField={
        let field = UITextField()
        field.placeholder = "Username "
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.lightGray.cgColor
        
        return field
    }()
    
    private let emailField: UITextField={
        let field = UITextField()
        field.placeholder = "Email "
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.lightGray.cgColor
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.lightGray.cgColor
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemTeal
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+100, width: view.width-40 , height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom+10, width: view.width-40 , height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-40 , height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom+10, width: view.width-40 , height: 52)
    }
    
    @objc private func didTapRegisterButton(){
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()

        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text,!password.isEmpty, password.count >= 8,
              let username = usernameField.text, !username.isEmpty else{
                return
        }
        // inserting a profile type in the realm file
        let bmiProfile = BmiProfile.create(withName: "", height: "", weight: "", email: email)
        let accProfile = AccProfile.create(withName: username, email: email)
        print("Write to Realm")
        try! realm.write {
            realm.add(bmiProfile)
            realm.add(accProfile)
        }
        print("User Realm User file location: \(realm.configuration.fileURL!.path)")
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) {registered in
            DispatchQueue.main.async{
            if registered{
                //good
            }
            else {
                //failed
            }}
        }
    }
  

}
extension RegistrationViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else {
            didTapRegisterButton()
        }
        return true
    }
}
