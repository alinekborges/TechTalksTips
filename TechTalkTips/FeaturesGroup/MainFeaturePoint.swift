//
//  MainFeaturePoint.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class MainFeaturePoint: FeaturePoint<UIViewController> {
    
    override var featureFactories: [FeatureFactory<UIViewController>] {
        return [TipsFeatureFactory(),
                SettingsFeatureFactory()]
    }
    
}

