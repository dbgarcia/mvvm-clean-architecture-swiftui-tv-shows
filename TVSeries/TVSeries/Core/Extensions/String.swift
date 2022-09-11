//
//  String.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import Foundation

extension String {
    func makeCleanerHtml() -> String {
        return self.replacingOccurrences(of: "<p>", with: "")
            .replacingOccurrences(of: "</p>", with: "")
            .replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "</b>", with: "")
    }
}
