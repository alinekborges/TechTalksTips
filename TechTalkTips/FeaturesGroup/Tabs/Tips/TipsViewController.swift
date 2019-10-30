//
//  TipsViewController.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class TipsViewController: UIViewController {
    
    let internalView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "Tips", image: UIImage(), selectedImage: nil)
        tabBarController?.tabBar.isHidden = false
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        view = internalView
    }
    
}
