//
//  ViewForDate.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 05/05/23.
//

import UIKit

class ViewForDate: UIView {
    
    var label    : String = ""
    var typeText : String = ""
    
    //    var delegate : doneButtonTapped!
    var textLabel : UILabel!
    var dateTextField : UITextField!
    
    var datePicker : UIDatePicker!
    
    init(labelName: String, type: String){
        super.init(frame: .zero)
        self.backgroundColor = .white
        label = labelName
        typeText = type
        loadView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView(){
        if textLabel == nil{
            textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = label
            self.addSubview(textLabel)
            
            NSLayoutConstraint.activate([
                textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                textLabel.heightAnchor.constraint(equalToConstant: 30),
                textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
            ])
        }
        
        if dateTextField == nil{
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self , action: #selector(doneButtonTapped))
            toolbar.setItems([doneBtn], animated: true)
            
            datePicker = UIDatePicker()
            datePicker.preferredDatePickerStyle = .wheels
            
            dateTextField = UITextField()
            dateTextField.translatesAutoresizingMaskIntoConstraints = false
            dateTextField.isUserInteractionEnabled = true
            dateTextField.inputView = datePicker
            dateTextField.placeholder = typeText
            dateTextField.inputAccessoryView = toolbar
            dateTextField.layer.borderWidth = 1
            dateTextField.layer.borderColor = UIColor.black.cgColor
            self.addSubview(dateTextField)
            
            NSLayoutConstraint.activate([
                dateTextField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
                dateTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                dateTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                dateTextField.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
    
    @objc func doneButtonTapped(){
        //        delegate.buttonTapped()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.endEditing(true)
        
    }
    
}


