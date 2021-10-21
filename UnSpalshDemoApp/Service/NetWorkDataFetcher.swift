//
//  NetWorkDataFetcher.swift
//  UnSpalshDemoApp
//
//  Created by Марк Пушкарь on 18.10.2021.
//

import Foundation

class NetWorkDataFetcher {
    
    var networkService = NetWorkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error reciever requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
//MARK: - Random Photo Logic
    func fetchRandomImages(completion: @escaping (unImage?) -> ()) {
        networkService.requestRandom { data, error in
            if let error = error {
                print("Error reciever requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: unImage.self, from: data)
            completion(decode)
        }
    }
    
}
