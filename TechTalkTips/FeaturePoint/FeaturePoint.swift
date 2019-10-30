//
//  FeaturePoint.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

class FeaturePoint<PluginType> {
    
    let cachedExperiments: CachedExperimenting
    
    var featureFactories: [FeatureFactory<PluginType>] {
        return []
    }
    
    init(cachedExperiments: CachedExperimenting) {
        self.cachedExperiments = cachedExperiments
    }
    
    func createFeatures() -> [PluginType] {
        return activeFeatures().map { feature in
            return feature.create()
        }
    }
    
    private func activeFeatures() -> [FeatureFactory<PluginType>] {
        return featureFactories.filter { feature in
            feature.isApplicable(experiments: cachedExperiments)
        }
    }
}
