//
//  MainTabController.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class MainTabViewController: UITabBarController {
    
    let featurePoint: MainFeaturePoint
    
    init(mainFeaturePoint: MainFeaturePoint) {
        self.featurePoint = mainFeaturePoint
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let features = featurePoint.createFeatures()
            .map { UINavigationController(rootViewController: $0) }
        self.viewControllers = features
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
