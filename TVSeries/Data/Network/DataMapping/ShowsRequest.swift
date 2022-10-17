//
//  SerieRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct ShowsRequest: RequestProtocol {
    var page: Int
    
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
    var path: String {
        return "/shows"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [String : String]? {
        return ["page": "\(self.page)"]
    }
}
