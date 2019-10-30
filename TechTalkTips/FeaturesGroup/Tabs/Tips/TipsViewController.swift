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
    
    let service: Servicing
    
    let internalView = UIView()
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    init(service: Servicing = Service()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
        let image = UIImage(systemName: "pencil.and.outline")
        self.tabBarItem = UITabBarItem(title: "Tips", image: image, selectedImage: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let shareActionFeaturePoint = ShareActionFeaturePoint(cachedExperiments: FakeExperiments())
        let actions = shareActionFeaturePoint.createFeatures()
        actions.forEach(self.addChild)
        
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        actions.compactMap { $0.view }.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
            stackView.addArrangedSubview(view)
        }
        
        service.getTips { tips in
            print(tips)
        }
    }
    
    override func loadView() {
        view = internalView
    }
    
}

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let button = UIButton()
        self.view.addSubview(button)
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        button.addTarget(self, action: #selector(self.goSomewhere), for: .touchUpInside)
    }
            
    @objc func goSomewhere() {
        let destination = CommentViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

class CommentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}

class ShareActionFeatureFactory: FeatureFactory<UIViewController> {
    
    init() {
        super.init {
            return ShareViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        return experiments.isOn(Experiments.settings)
    }
}

class CommentActionFeatureFactory: FeatureFactory<UIViewController> {
    
    init() {
        super.init {
            return CommentViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        return experiments.isOn(Experiments.settings)
    }
}


class ShareActionFeaturePoint: FeaturePoint<UIViewController> {
    
    override var featureFactories: [FeatureFactory<UIViewController>] {
        return [ShareActionFeatureFactory(),
                CommentActionFeatureFactory()]
    }
    
}

