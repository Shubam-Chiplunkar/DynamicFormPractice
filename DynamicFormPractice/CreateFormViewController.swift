//
//  CreateFormViewController.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 04/05/23.
//

import UIKit
protocol createFormDetailsPassed{
    func didPassedFormDetails(label: String , type: String, index: Int)
}
class CreateFormViewController: UIViewController, UITextFieldDelegate, dataPassed{
    

    var typeTextField   : UITextField!
    var nameTextField   : UITextField!
    var addDetailButton : UIButton!
    
    
    var typeString  : String = " "
    var indexPath : Int = 0
    
    var delegate : createFormDetailsPassed!
//    var secondView      : SecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadPage()
        
    }
    
    func loadPage(){
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        nameTextField.isEnabled = true
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.cornerRadius = 10
        nameTextField.clipsToBounds = true
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        typeTextField = UITextField()
        typeTextField.translatesAutoresizingMaskIntoConstraints = false
        typeTextField.placeholder = "Type"
        typeTextField.isEnabled = true
        typeTextField.layer.borderWidth = 1
        typeTextField.layer.borderColor = UIColor.black.cgColor
        typeTextField.layer.cornerRadius = 10
        typeTextField.clipsToBounds = true
        typeTextField.delegate = self
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnTypeTextField))
//        typeTextField.addGestureRecognizer(tapGesture)
        view.addSubview(typeTextField)
        
        NSLayoutConstraint.activate([
            typeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            typeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            typeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addDetailButton = UIButton()
        addDetailButton.translatesAutoresizingMaskIntoConstraints = false
        addDetailButton.setTitle("Add form", for: .normal)
        addDetailButton.backgroundColor = .cyan
        addDetailButton.addTarget(self, action: #selector(addDetailButtonClick), for: .touchUpInside)
        view.addSubview(addDetailButton)
        
        NSLayoutConstraint.activate([
            addDetailButton.topAnchor.constraint(equalTo: typeTextField.bottomAnchor, constant: 30),
            addDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addDetailButton.heightAnchor.constraint(equalToConstant: 40),
            addDetailButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
    
    func datadDidPassed(type: String, indexNumber: Int) {
        typeTextField.text = type
        indexPath = indexNumber
    }
    
    @objc func addDetailButtonClick(){
//        let vc = ViewController()
        delegate.didPassedFormDetails(label: nameTextField.text!, type: typeTextField.text!, index: indexPath)
        navigationController?.popViewController(animated: true)
    }
    
   
    
    //MARK: typeTextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == typeTextField{
            let vc = SecondViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
            typeTextField.endEditing(true)
        }
       
    }
//    @objc func tapOnTypeTextField(){
//        let vc = SecondViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//


}
