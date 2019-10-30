//
//  SettingsFeaturePoint.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

class SettingsFeatureFactory: FeatureFactory {
    
    init() {
        super.init { () -> FeatureType in
            return SettingsViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        return experiments.isOn(Experiments.settings)
    }
    
}

