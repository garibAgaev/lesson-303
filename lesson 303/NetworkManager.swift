//
//  NetworkManager.swift
//  lesson 303
//
//  Created by Garib Agaev on 02.09.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let key = "4b17f00db3804d03965140234233108"
    private let baseURL = "https://api.weatherapi.com/v1"
    
    private init() {}
    
    enum Error1: String, Error {
        case sorry1 = "Данный функционал еще не реализован."
        case sorry2 = "Введены некорректные параметры."
        case sorry3 = "Введен неверный URL адрес."
        case sorry4 = "Ошибка извлечения data"
        case sorry5 = "Ну эту ошибку никто не увидит"
    }
    
    enum Request: String {
        case currentWeather = "/current.json"
        case forecast = "/forecast.json"
        case searchOrAutocomplete = "/search.json"
        case history = "/history.json"
        case marine = "/marine.json"
        case future = "/future.json"
        case timeZone = "/timezone.json"
        case sports = "/sports.json"
        case astronomy = "/astronomy.json"
        case ipLookup = "/ip.json"
    }
    
    func generateURL(_ request: Request, q: String, days: Int?) -> Result<URL, Error1> {
        switch request {
        case .currentWeather:
            let str = "\(baseURL)\(request.rawValue)?key=\(key)&q=\(q)"
            guard let url = URL(string: str) else { return .failure(.sorry3) }
            return .success(url)
        case .forecast:
            guard let days = days, 0 < days && days <= 14 else { return .failure(.sorry2)}
            let str = "\(baseURL)\(request.rawValue)?key=\(key)&q=\(q)&days=\(days)"
            guard let url = URL(string: str) else { return .failure(.sorry3) }
            return .success(url)
        case .searchOrAutocomplete:
            let str = "\(baseURL)\(request.rawValue)?key=\(key)&q=\(q)"
            guard let url = URL(string: str) else { return .failure(.sorry3) }
            return .success(url)
        default:
            return .failure(.sorry1)
        }
    }
    
    func dfs<T: Decodable>(_ request: Request, q: String, days: Int?, comletion: @escaping(T) -> Void) {
        let res = generateURL(request, q: q, days: days)
        switch res {
        case .success(let url):
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? Error1.sorry4.rawValue)
                    return
                }
                do {
                    let type = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        comletion(type)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        case .failure(let error):
            print(error.rawValue)
        }
    }
}
