//
//  NetworkManager.swift
//  Navigation
//
//  Created by Sergey on 24.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let errorExists = error {
                    print(errorExists.localizedDescription)
                }
                if let safeData = data {
                    guard let string = String(data: safeData, encoding: .utf8) else { return }
                    print("ДАННЫЕ \(string)")
                }
                guard let httpResponse = response as? HTTPURLResponse else { return }
                print("ОТВЕТ \(httpResponse.allHeaderFields)")
                print("СТАТУС КОД РАВЕН \(httpResponse.statusCode)")
            }
                .resume()
        }
    }
}

enum AppConfiguration: Equatable {
    case firstCase(first: String)
    case secondCase(second: String)
    case thirdCase(third: String)
    
    var urlString: String {
        switch self {
        case .firstCase(let first):
            return first
        case .secondCase(let second):
            return second
        case .thirdCase(let third):
            return third
        }
    }
}
