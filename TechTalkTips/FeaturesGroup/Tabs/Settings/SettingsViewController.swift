//
//  SettingsViewController.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    let internalView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let image = UIImage(systemName: "gear")
        self.tabBarItem = UITabBarItem(title: "Settings", image: image, selectedImage: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        view = internalView
    }
    
}

