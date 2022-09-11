//
//  SerieRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct ShowsRequest: BaseRequest {
    var page: Int
    
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
    var path: String {
        return "/shows"
    }
    
    var method: BaseMethod {
        return .GET
    }
    
    var queryItems: [String : String] {
        return ["page": "\(self.page)"]
    }
}
