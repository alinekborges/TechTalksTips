//
//  Service.swift
//  TechTalkTips
//
//  Created by Aline Borges on 30/10/19.
//  Copyright © 2019 Aline Borges. All rights reserved.
//

import Foundation

protocol Servicing {
    func getTips(completion: @escaping ([Tip])->Void)
}

class Service: Servicing {
    
    private let url = "https://raw.githubusercontent.com/alinekborges/TechTalksTips/master/MainTips.json"
    
    func getTips(completion: @escaping ([Tip])->Void) {
        guard let url = URL(string: self.url) else { return completion([]) }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return completion([])}
            let decoder = JSONDecoder()
            
            DispatchQueue.main.async {
                do {
                    let tips = try decoder.decode([Tip].self, from: data)
                    completion(tips)
                } catch {
                    completion([])
                }
            }
        }.resume()
    }
}
