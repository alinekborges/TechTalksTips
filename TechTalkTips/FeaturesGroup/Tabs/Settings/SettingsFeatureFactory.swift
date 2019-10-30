//
//  SettingsFeaturePoint.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class SettingsFeatureFactory: FeatureFactory<UIViewController> {
    
    init() {
        super.init {
            return SettingsViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        return experiments.isOn(Experiments.settings)
    }
    
}

