//
//  ViewController.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 04/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, createFormDetailsPassed {
    

    var addComponentButton : UIButton!
    var saveForm           : UIButton!
    var formTableView      : UITableView!
    
    var labelArray : [String] = []
    var typeArray : [String] = []
    var indexpath : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadPage()
        
    }
    
    func loadPage(){
        addComponentButton = UIButton()
        addComponentButton.translatesAutoresizingMaskIntoConstraints = false
        addComponentButton.setTitle("Add Component", for: .normal)
        addComponentButton.backgroundColor = .green
        addComponentButton.addTarget(self, action: #selector(addComponentClick), for: .touchUpInside)
        view.addSubview(addComponentButton)
        
        NSLayoutConstraint.activate([
            addComponentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            addComponentButton.heightAnchor.constraint(equalToConstant: 50),
            addComponentButton.widthAnchor.constraint(equalToConstant: 100),
            addComponentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        saveForm = UIButton()
        saveForm.translatesAutoresizingMaskIntoConstraints = false
        saveForm.setTitle("Save", for: .normal)
        saveForm.backgroundColor = .green
        view.addSubview(saveForm)
        
        NSLayoutConstraint.activate([
           saveForm.topAnchor.constraint(equalTo: addComponentButton.bottomAnchor, constant: 20),
           saveForm.heightAnchor.constraint(equalToConstant: 50),
           saveForm.widthAnchor.constraint(equalToConstant: 100),
           saveForm.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        formTableView = UITableView()
        formTableView.translatesAutoresizingMaskIntoConstraints = false
        formTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        formTableView.delegate = self
        formTableView.dataSource = self
        view.addSubview(formTableView)
        
        NSLayoutConstraint.activate([
            formTableView.topAnchor.constraint(equalTo: saveForm.bottomAnchor, constant: 20),
            formTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    //MARK: createFormDetailsPassed Delegate
    func didPassedFormDetails(label: String, type: String, index: Int) {
        labelArray.append(label)
        typeArray.append(type)
        formTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = formTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = labelArray[indexPath.row]
        cell.detailTextLabel?.text = typeArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
    @objc func addComponentClick(){
        let vc = CreateFormViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    


}

