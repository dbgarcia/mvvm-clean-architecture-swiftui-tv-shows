//
//  SearchViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class SearchViewModel: ObservableObject {
    private let searchRespository: SearchRepository
    
    init(searchRespository: SearchRepository = Container.searchRepository()) {
        self.searchRespository = searchRespository
    }
    
    @MainActor
    func fetchSearch() async {
        do {
            let shows = try await searchRespository.fetchSearchShows(of: "arrow")
            shows.forEach { debugPrint($0.name) }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
