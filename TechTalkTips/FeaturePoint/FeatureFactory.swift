//
//  FeatureFactory.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

class FeatureFactory<PluginType> {
    
    public let create: () -> PluginType
    
    public init(create: @escaping () -> PluginType) {
        self.create = create
    }
    
    open func isApplicable(experiments: CachedExperimenting) -> Bool {
        return false
    }
}
