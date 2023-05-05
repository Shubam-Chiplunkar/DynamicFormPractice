//
//  ViewForText.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 05/05/23.
//

import UIKit

class ViewForText: UIView {
    
    var createLabel : UILabel!
    var createTextField : UITextField!
    
    var labelName : String = ""
    var typeText  : String = ""
    
    init(label: String, type: String){
        super.init(frame: .zero)
        self.backgroundColor = .white
        labelName = label
        typeText = type
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadView(){
        if createLabel == nil{
            createLabel = UILabel()
            createLabel.text = labelName
            createLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(createLabel)
            
            NSLayoutConstraint.activate([
                createLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                createLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                createLabel.heightAnchor.constraint(equalToConstant: 30),
                createLabel.widthAnchor.constraint(equalToConstant: 70),
            ])
        }
        
        if createTextField == nil{
            createTextField = UITextField()
            createTextField.translatesAutoresizingMaskIntoConstraints = false
            //        createTextField.placeholder =
            createTextField.layer.borderWidth = 1
            createTextField.layer.borderColor = UIColor.black.cgColor
            self.addSubview(createTextField)
            
            NSLayoutConstraint.activate([
                createTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                createTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                createTextField.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 10),
                createTextField.heightAnchor.constraint(equalToConstant: 30),
                //                   createTextField.widthAnchor.constraint(equalToConstant: 70),
            ])
        }
    }
    
}
