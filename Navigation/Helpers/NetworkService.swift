//
//  NetworkService.swift
//  Navigation
//
//  Created by Sergey on 09.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

struct NetworkService {
    
   static let session = URLSession.shared
    
    static func dataTask(url: URL, complition: @escaping (String?) -> Void) {
        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print (error.debugDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            if let data = data {
                complition(String(data: data, encoding: .utf8))
            }
        }.resume()
    }
}
