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
    
    static var applicationConfiguration: AppConfiguration?
    
    static func dataTask(url: URL, complition: @escaping (String?) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let string = String(data: data, encoding: .utf8) else { return }
                print("ДАННЫЕ \(string)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print("ОТВЕТ \(httpResponse.allHeaderFields)")
            print("СТАТУС КОД РАВЕН \(httpResponse.statusCode)")
            
            guard error == nil else {
                print ("WI-FI ВЫКЛЮЧЕН \(error.debugDescription)")
                return
            }
        }.resume()
    }
}

enum AppConfiguration: Equatable {
    case firstCase(URL)
    case secondCase(URL)
    case thirdCase(URL)
}

enum URLS {
    static let firstUrl = "https://swapi.dev/api/people/8"
    static let secondUrl = "https://swapi.dev/api/starships/3"
    static let thirdUrl = "https://swapi.dev/api/planets/5"
}

