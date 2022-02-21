//
//  NetworkManager.swift
//  Navigation
//
//  Created by Sergey on 24.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    var delegate: QuoteDelegate?
   
    func performRequest(with urlString: String) {
        var item = Item(userID: nil, id: nil, title: nil, completed: nil)
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) {  data, response, error in
                if let errorExists = error {
                    print(errorExists.localizedDescription)
                }
                if let safeData = data {
                    guard String(data: safeData, encoding: .utf8) != nil else { return }
                    guard let json = try? JSONSerialization.jsonObject(with: safeData, options: []) as? [String: AnyObject] else {return}
                    let quote = json["title"] as AnyObject
                    let newString = String(describing: quote)
                    item.title = newString
                    self.delegate?.updateQuote(networManagwer: self, dataModel: item)
                }
                guard let httpResponse = response as? HTTPURLResponse else { return }
            }
                .resume()
        }
    }
    
    func anotherRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if let errorExists = error {
                    print(errorExists.localizedDescription)
                }
                if let safeData = data {
                    if let planet = self.parseJson(planetData: safeData) {
                        self.delegate?.updatePlanet(networManagwer: self, dataModel: planet)
                    }
                }
            }
            .resume()
        }
    }
    
    func parseJson(planetData: Data) -> PlanetModel?{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(PlanetModel.self, from: planetData)
            let planetName = decodedData.name
            let planetRotationPeriod = decodedData.rotationPeriod
            let planetOrbitalPeriod = decodedData.orbitalPeriod
            let planet = PlanetModel(name: planetName, rotationPeriod: planetRotationPeriod, orbitalPeriod: planetOrbitalPeriod, diameter: nil, climate: nil, gravity: nil, terrain: nil, surfaceWater: nil, population: nil, residents: nil, films: nil, created: nil, edited: nil, url: nil)
            return planet
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
}
