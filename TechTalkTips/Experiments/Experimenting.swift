//
//  Experiments.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

protocol FeatureType {}
protocol ExperimentKeying {}

protocol CachedExperimenting {
    func isOn(_ name: ExperimentKeying) -> Bool
}
