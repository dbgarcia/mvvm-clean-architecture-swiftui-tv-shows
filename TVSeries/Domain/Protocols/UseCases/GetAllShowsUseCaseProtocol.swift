//
//  GetAllShowsUseCase.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

protocol GetAllShowsUseCaseProtocol {
    func execute(page: Int) async throws -> [Showable]
}
