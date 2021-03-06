//
//  SearchResults.swift
//  UnSpalshDemoApp
//
//  Created by Марк Пушкарь on 18.10.2021.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
    
    
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
