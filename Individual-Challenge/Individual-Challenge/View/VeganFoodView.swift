//
//  VeganFoodView.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 15/10/22.
//

import UIKit

class VeganFoodView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        self.labelConfigConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
       let label = UILabel()
        label.text = "Some Vegan foods"
        label.textColor = UIColor(named: "PrimaryColor2")
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func labelConfigConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)]
        )
    }
}
