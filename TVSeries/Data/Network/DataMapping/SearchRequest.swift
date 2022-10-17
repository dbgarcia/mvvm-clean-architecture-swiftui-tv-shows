//
//  SearchRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct SearchRequest: RequestProtocol {
    var name: String
    
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
    var path: String {
        return "/search/shows"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [String : String]? {
        return ["q": name]
    }
}
