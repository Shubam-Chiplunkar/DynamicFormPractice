//
//  SecondViewController.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 04/05/23.
//

import UIKit
protocol dataPassed{
    func datadDidPassed(type: String, indexNumber: Int)
}
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView : UITableView!
    var typeArray : [String] = []
    var delegate  : dataPassed!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        loadTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getConstantValue()
    }
    
    
    func getConstantValue(){
        typeArray.append(AppConstant.constantText)
        typeArray.append(AppConstant.constantDate)
        typeArray.append(AppConstant.constantImage)
        
    }
    
    func loadTableView(){
        myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = typeArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CreateFormViewController()
        vc.typeString = typeArray[indexPath.row]
        delegate.datadDidPassed(type: vc.typeString, indexNumber: indexPath.row)
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
