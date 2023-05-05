//
//  ViewForImage.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 05/05/23.
//

import UIKit
protocol imageTapped{
    func tapImage()
}

class ViewForImage: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var createLabel : UILabel!
    var createImageView : UIImageView!
    
    var labelText : String = ""
    var typeText : String = ""
    
    var delegate : imageTapped!

    init(){
        super.init(frame: .zero)
    }
    
    init(label: String, type: String){
        super.init(frame: .zero)
        labelText = label
        typeText = type
        self.backgroundColor = .white
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView(){
        
        if createLabel == nil{
            createLabel = UILabel()
            createLabel.translatesAutoresizingMaskIntoConstraints = false
            createLabel.text = labelText
            self.addSubview(createLabel)
            
            NSLayoutConstraint.activate([
                createLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                createLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
                createLabel.heightAnchor.constraint(equalToConstant: 30),
                createLabel.widthAnchor.constraint(equalToConstant: 70),
            ])
            
        }
        
        if createImageView == nil{
            createImageView = UIImageView()
            createImageView.translatesAutoresizingMaskIntoConstraints = false
            createImageView.backgroundColor = .systemGray
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
            createImageView.addGestureRecognizer(tapGesture)
            createImageView.isUserInteractionEnabled = true
            self.addSubview(createImageView)
            
            NSLayoutConstraint.activate([
                createImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                createImageView.leadingAnchor.constraint(equalTo: createLabel.trailingAnchor, constant: 20),
                createImageView.heightAnchor.constraint(equalToConstant: 80),
                createImageView.widthAnchor.constraint(equalToConstant: 80),
            ])
        }
    }
    
    @objc func tapOnImage(){
        delegate.tapImage()
    }
    
    func updateView(image: UIImage) {
        createImageView.image = image
    }
    
}
