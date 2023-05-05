//
//  FormTableViewCell.swift
//  DynamicFormPractice
//
//  Created by mayank ranka on 05/05/23.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
    var label : UILabel!
    var type  : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        loadCell()
    }
    
    func loadCell(){
        
        if label == nil{
            label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                label.heightAnchor.constraint(equalToConstant: 30),
                label.widthAnchor.constraint(equalToConstant: 100),
            ])
        }
        
        
        if type == nil{
            type = UILabel()
            type.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(type)
            
            NSLayoutConstraint.activate([
                type.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                type.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                type.heightAnchor.constraint(equalToConstant: 30),
                type.widthAnchor.constraint(equalToConstant: 100)
            ])
        }
        
    }
    
}
