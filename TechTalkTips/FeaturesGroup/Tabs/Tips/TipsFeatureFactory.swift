//
//  TipsFeaturePoint.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

class TipsFeatureFactory: FeatureFactory {
    
    init() {
        super.init { () -> FeatureType in
            return TipsViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        return experiments.isOn(Experiments.tips)
    }
    
}

