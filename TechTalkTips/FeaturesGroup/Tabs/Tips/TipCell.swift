//
//  TipCell.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import UIKit

class TipCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "lala"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(_ text: String) {
        self.label.text = text
    }
    
    func configureViews() {
        self.addSubview(containerView)
        containerView.addSubview(label)
        
        containerView.prepareForConstraints()
        containerView.pinEdgesToSuperview()
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        
        label.prepareForConstraints()
        label.pinEdgesToSuperview()
    }
}
