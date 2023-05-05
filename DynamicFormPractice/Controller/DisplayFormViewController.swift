//
//  DisplayFormViewController.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 05/05/23.
//

import UIKit
//protocol doneButtonTapped{
//    func buttonTapped()
//}
class DisplayFormViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, imageTapped {
    
    var labelArray : [String] = []
    var typeArray : [String] = []
    
    var mainStackView : UIStackView!
    var baseView : UIView!
    var imageVIew : ViewForImage!
    
    var datePicker : UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      let viewController = ViewController()
        view.backgroundColor = .white
        
        loadPage()
        //        viewController.delegate = self
        print(labelArray)
        print(typeArray)
        
    }
    
    func loadPage(){
        loadStackView()
        for i in 0..<typeArray.count{
            
            if typeArray[i] == AppConstant.constantText{
                let mainView = ViewForText(label: labelArray[i], type: typeArray[i])
                mainStackView.addArrangedSubview(mainView)
                
                NSLayoutConstraint.activate([
                    mainView.heightAnchor.constraint(equalToConstant: 100),
                    mainView.widthAnchor.constraint(equalToConstant: 200),
                ])
            }
            else if typeArray[i] == AppConstant.constantDate{
                let mainView = ViewForDate(labelName: labelArray[i], type: typeArray[i])
                mainStackView.addArrangedSubview(mainView)
                
                NSLayoutConstraint.activate([
                    mainView.heightAnchor.constraint(equalToConstant: 100),
                    mainView.widthAnchor.constraint(equalToConstant: 200),
                ])
            }
            else if typeArray[i] == AppConstant.constantImage{
                imageVIew = ViewForImage(label: labelArray[i], type: typeArray[i])
                imageVIew.delegate = self
                mainStackView.addArrangedSubview(imageVIew)
                
                NSLayoutConstraint.activate([
                    imageVIew.heightAnchor.constraint(equalToConstant: 100),
                    imageVIew.widthAnchor.constraint(equalToConstant: 200),
                ])
            }
        }
        
    }
    
    //
    //    func buttonTapped() {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateStyle = .short
    //        dateFormatter.timeStyle = .none
    //         = dateFormatter.string(from: datePicker.date)
    //        self.endEditing(true)
    //    }
    
    func tapImage(){
        let pc = UIImagePickerController()
        pc.sourceType = .photoLibrary
        pc.delegate = self
        pc.allowsEditing = true
        present(pc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        //        for i in 0..<typeArray.count{
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imageVIew.updateView(image: image)
            
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
    func loadStackView(){
        mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.backgroundColor = .black
        mainStackView.spacing = 10
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //    func loadView(myView : UIView) -> UIView{
    //        baseView = myView
    //        baseView.translatesAutoresizingMaskIntoConstraints = false
    //        baseView.backgroundColor = .white
    //        mainStackView.addArrangedSubview(baseView)
    //
    //        NSLayoutConstraint.activate([
    //            baseView.heightAnchor.constraint(equalToConstant: 100),
    //            baseView.widthAnchor.constraint(equalToConstant: 200)
    //        ])
    //
    //        return baseView
    //    }
    
}
