//
//  NetWorkService.swift
//  UnSpalshDemoApp
//
//  Created by Марк Пушкарь on 17.10.2021.
//

import Foundation

class NetWorkService {
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parametets = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(param: parametets)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        
    }
    
    private func prepareHeader() -> [String: String] {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID sQprT-VsvzzB5_FJAxuvlddPx7cWXQjd7L0ITZIWRh4"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(param: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = param.map {
            URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
