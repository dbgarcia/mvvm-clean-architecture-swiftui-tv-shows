//
//  SearchRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct SearchRequest: BaseRequest {
    var name: String
    
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
    var path: String {
        return "/search/shows"
    }
    
    var method: BaseMethod {
        return .GET
    }
    
    var queryItems: [String : String]? {
        return ["q": name]
    }
}
