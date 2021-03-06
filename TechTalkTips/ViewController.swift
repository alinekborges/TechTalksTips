//
//  ViewController.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let internalView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "title", image: UIImage(), selectedImage: nil)
        tabBarController?.tabBar.isHidden = false
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        view = internalView
    }
    
}
