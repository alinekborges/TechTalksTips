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
    
    private let internalView = TipsView()
    private var tips: [Tip] = []
    
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
        internalView.tableView.dataSource = self
        internalView.tableView.delegate = self
        internalView.tableView.register(TipCell.self, forCellReuseIdentifier: TipsView.identifier)
        fetchData()
        
        //self.view.backgroundColor = .white
        
//        let shareActionFeaturePoint = ShareActionFeaturePoint(cachedExperiments: FakeExperiments())
//        let actions = shareActionFeaturePoint.createFeatures()
//        actions.forEach(self.addChild)
//
//        self.view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
//        //stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//
//        actions.compactMap { $0.view }.forEach { view in
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//            stackView.addArrangedSubview(view)
//        }
        
        
    }
    
    func fetchData() {
        service.getTips { [weak self] tips in
            self?.tips = tips
            self?.internalView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = internalView
    }
    
}

extension TipsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TipsView.identifier) as! TipCell
        let tip = self.tips[indexPath.row]
        cell.setText(tip.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = self.tips[indexPath.row]
        let detailsController = DetailsViewController(tip: selected)
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
}

fileprivate class TipsView: UIView {
    
    static var identifier = String(describing: TipsView.self)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        return tableView
    }()
    
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
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.prepareForConstraints()
        tableView.pinEdgesToSuperview()
    }
    
}
