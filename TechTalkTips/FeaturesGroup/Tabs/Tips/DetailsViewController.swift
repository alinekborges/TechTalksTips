
//
//  DetailsViewControlle.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let tip: Tip
    
    private let internalView = DetailsView()
    
    init(tip: Tip) {
        self.tip = tip
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tip.description)
        
        let button = ShareButton()
        let item = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItems = [item]
        
    }
    
    @objc func didTapShare() {
        print("hey")
    }
    
    override func loadView() {
        self.view = internalView
    }
    
}

fileprivate class DetailsView: UIView {
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        build()
        setupConstraints()
    }
    
    private func build() {
        self.backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
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

class ShareFeature {
    
    lazy var barButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "blabla",
                               style: .plain,
                               target: self,
                               action: #selector(self.didTapShare))
    }()
    
    //    init() {
    //        self.barButtonItem = UIBarButtonItem(title: "blabla",
    //                                             style: .plain,
    //                                             target: self,
    //                                             action: #selector(ShareFeature.didTapShare))
    //    }
    
    @objc func didTapShare() {
        print("hey")
    }
}

class ShareButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(self.didTapShare), for: .touchUpInside)
        self.setTitle("bla", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapShare() {
        print("hey2")
    }
}
