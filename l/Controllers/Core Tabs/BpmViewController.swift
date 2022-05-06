//
//  ExploreViewController.swift
//  l
//
//  Created by user217575 on 4/25/22.
//

import UIKit

class ExploreViewController: UIViewController {

    private let infoLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 40, width: 400, height: 200))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 6
        label.textAlignment = .center
        label.text = "Hello!\n Are you wondering if you fall beneth the fat category?\n Maybe u're closer to the obese!\n Don't worry , if you need a rough estimate that's what we'll give ya  ;)"
        label.textColor = .label
        return label
    }()
    
    private let ageLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 240, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Age :"
        label.textColor = .label
        label.backgroundColor = .cyan
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let ageField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 240, width: 180, height: 40))
        textField.backgroundColor = .green
        return textField
    }()
   
    private let heightLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 300, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Height :"
        label.textColor = .label
        label.backgroundColor = .cyan
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let heightField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 300, width: 180, height: 40))
        textField.backgroundColor = .green
        return textField
    }()
    
    private let weightLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 360, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Weight :"
        label.textColor = .label
        label.backgroundColor = .cyan
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    private let weightField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 114, y: 360, width: 180, height: 40))
        textField.backgroundColor = .green
        return textField
    }()
  
    
    //radio button
    private let maleLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 60, y: 420, width: 70, height: 40))
        label.textAlignment = .center
        label.text = "Male"
        label.textColor = .label
        label.backgroundColor = .orange
        return label
    }()
    private let femaleLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 260, y: 420, width: 70, height: 40))
     label.textAlignment = .center
     label.text = "Female"
     label.textColor = .label
     label.backgroundColor = .orange
     return label
 }()
    
    private let gridButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 70, y: 470, width: 50, height: 50))
        button.clipsToBounds = true
        button.tintColor = .systemPink
        button.setBackgroundImage(UIImage(systemName: "radio"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 470, width: 50, height: 50))
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
        
        
}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gridButton.addTarget(self, action: #selector(didTapGridButton1), for: .touchUpInside)
        taggedButton.addTarget(self, action: #selector(didTapTaggedButton1), for: .touchUpInside)
    }
}
