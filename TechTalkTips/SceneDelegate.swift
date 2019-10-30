//
//  SceneDelegate.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let mainFeaturePoint = MainFeaturePoint(cachedExperiments: FakeExperiments())
        
        window?.rootViewController = MainTabViewController(mainFeaturePoint: mainFeaturePoint)
        window?.makeKeyAndVisible()
    }
    
}

class FakeExperiments: CachedExperimenting {
    
    func isOn(_ name: ExperimentKeying) -> Bool {
        switch name {
        case Experiments.tips:
            return true
        case Experiments.settings:
            return true
        default:
            return false
        }
    }
    
}
