//
//  ExploreViewController.swift
//  l
//
//  Created by user217575 on 4/25/22.
//

import UIKit
import RealmSwift

class ExploreViewController: UIViewController {
    
    let realm = try! Realm()

    
    private let infoLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 40, width: 400, height: 200))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        label.textAlignment = .center
        label.text = "Hello!\n Are you wondering if you fall beneath the fat category?\n Maybe u're closer to the obese!\n Don't worry , if you need a rough estimate that's what we'll give ya  ;)\nPs:Gender radio button is placebo"
        label.textColor = .label
        return label
    }()
    
    private let ageLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 240, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Age :"
        label.textColor = .label
        //label.backgroundColor = .cyan
        label.layer.borderWidth = 0
        //label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let ageField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 240, width: 180, height: 40))
        textField.backgroundColor = .tertiarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return textField
    }()
   
    private let heightLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 300, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Height :"
        label.textColor = .label
        //label.backgroundColor = .cyan
        label.layer.borderWidth = 0
        //label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let heightField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 300, width: 180, height: 40))
        textField.backgroundColor = .tertiarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return textField
    }()
    
    private let weightLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 360, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Weight :"
        label.textColor = .label
        //label.backgroundColor = .cyan
        //label.layer.borderWidth = 1
        //label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let weightField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 360, width: 180, height: 40))
        textField.backgroundColor = .tertiarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondarySystemBackground.cgColor
       // let data = realm.objects(BmiProfile.self).first
        //textField.text = data.first?.weight()
        return textField
    }()
  
    
    //radio button
    private let maleLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 60, y: 420, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Male"
        label.textColor = .label
        //label.backgroundColor = .orange
        return label
    }()
    private let femaleLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 260, y: 420, width: 70, height: 40))
     label.textAlignment = .center
     label.text = "Female"
     label.textColor = .label
     //label.backgroundColor = .orange
     return label
 }()
    
    private let gridButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 70, y: 460, width: 50, height: 50))
        button.clipsToBounds = true
        button.tintColor = .systemPink
        button.setBackgroundImage(UIImage(systemName: "radio"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 460, width: 50, height: 50))
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "radio.fill"), for: .normal)
        return button
    }()
    
    @objc private func didTapGridButton1() {
        gridButton.tintColor = .systemPink
        taggedButton.tintColor = .lightGray
    }
    
    @objc private func didTapTaggedButton1() {
        gridButton.tintColor = .lightGray
        taggedButton.tintColor = .systemPink
    }
    
    //to be changed regarding bmi
    private let  resultLabel: UILabel! = {
    let label = UILabel(frame: CGRect(x: 60, y: 600, width: 330, height: 80))
     label.lineBreakMode = .byWordWrapping
     label.numberOfLines = 7
     label.textAlignment = .center
     label.text = ""
     label.textColor = .label
     //label.backgroundColor = .orange
     return label
 }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 170, y: 520, width: 80, height: 40))
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setTitle ("Calculate", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        return button
    }()
    
    private let insertDataButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 520, width: 130, height: 40))
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setTitle ("Insert old data", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        return button
    }()
    
    private let deleteDataButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 520, width: 80, height: 40))
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setTitle ("Delete", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        return button
    }()
    var  bmi :Float = 0
    
    
    
    @objc private func didTapCalculateButton() {
        let weight = Float(weightField.text!) ?? 0.0
        let height = Float(heightField.text!) ?? 0.0

        // let table = realm.objects(BmiProfile.self).filter("email == \(myEmail)", 1)
        
        let  myEmail : String = AuthManager.shared.getEmail()
        if let table = realm.objects(BmiProfile.self).filter("email == '\(myEmail)'").first
        {
            try! realm.write {
                table.age = ageField.text!
                table.height = heightField.text!
                table.weight = weightField.text!
            }
            
        }
        else {
            let bmiProfile = BmiProfile.create(withName: ageField.text!, height: heightField.text!, weight: weightField.text!, email: myEmail)
            print("Write to Realm")
            try! realm.write {
                realm.add(bmiProfile)
            }
            print("User Realm User file location: \(realm.configuration.fileURL!.path)")
        }
        
        bmi = weight/(height*height/10000)
        let age = Float(ageField.text!) ?? 0.0
        if (bmi < 18.5 && age<18 ){
            resultLabel.text = "Your bmi is: \(bmi).\n You have time to gain weight"
        }
        else if(bmi < 18.5 && age>=18 && age<70){
            resultLabel.text = "Your bmi is: \(bmi).\n Underweight...better luck next time!"
        }
        else if(bmi > 18.5 && bmi<=25 && age<70){
            resultLabel.text = "Your bmi is: \(bmi).\n Doing swell"
        }
        else if(bmi > 18.5 && bmi<=25 && age>=70){
            resultLabel.text = "Your bmi is: \(bmi).\n Better then ever"
        }
        else if(bmi > 25){
            resultLabel.text = "Your bmi is: \(bmi).\n Overweight or very muscalar. I can't tell but you already know , right?."
        }
        
    }
    
    @objc private func didTapInsertDataButton() {
        let  myEmail : String = AuthManager.shared.getEmail()
        let data = realm.objects(BmiProfile.self).filter("email == '\(myEmail)'").first
        ageField.text = data?.age
        weightField.text = data?.weight
        heightField.text = data?.height
    }
    
    @objc private func didTapDeleteDataButton() {
        let  myEmail : String = AuthManager.shared.getEmail()
        if let valueToDelete = realm.objects(BmiProfile.self).filter("email == '\(myEmail)'").first{
       try! realm.write {
           realm.delete(valueToDelete)
       }
        ageField.text = nil
        weightField.text = nil
        heightField.text = nil
        }
        else {
            print("ok")
        }

        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        self.view.addSubview(infoLabel)
        self.view.addSubview(ageField)
        self.view.addSubview(ageLabel)
        self.view.addSubview(heightField)
        self.view.addSubview(heightLabel)
        self.view.addSubview(weightField)
        self.view.addSubview(weightLabel)
        self.view.addSubview(gridButton)
        self.view.addSubview(taggedButton)
        self.view.addSubview(maleLabel)
        self.view.addSubview(femaleLabel)
        self.view.addSubview(calculateButton)
        self.view.addSubview(resultLabel)
        self.view.addSubview(insertDataButton)
        self.view.addSubview(deleteDataButton)
        
}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gridButton.addTarget(self, action: #selector(didTapGridButton1), for: .touchUpInside)
        taggedButton.addTarget(self, action: #selector(didTapTaggedButton1), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        deleteDataButton.addTarget(self, action: #selector(didTapDeleteDataButton), for: .touchUpInside)
        insertDataButton.addTarget(self, action: #selector(didTapInsertDataButton), for: .touchUpInside)
    }
}

