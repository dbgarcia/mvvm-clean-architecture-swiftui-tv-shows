//
//  GetShowUseProtocol.swift
//  TVSeries
//
//  Created by Douglas Garcia on 17/10/22.
//

import Foundation

protocol SearchShowsUseCaseProtocol {
    func execute(name: String) async throws -> [Showable]
}
