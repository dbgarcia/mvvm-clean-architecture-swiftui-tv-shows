//
//  EpisodesRequest.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct EpisodesRequest: BaseRequest {
    var idShow: Int
    
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
    var path: String {
        return "/shows/\(idShow)/episodes"
    }
    
    var method: BaseMethod {
        return .GET
    }
    
    var queryItems: [String : String]? {
        return nil
    }
}
