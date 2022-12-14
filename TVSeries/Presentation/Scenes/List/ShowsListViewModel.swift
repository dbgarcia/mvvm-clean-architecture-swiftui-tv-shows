//
//  ListSeriesViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol ShowsViewModelProtocol {
    var isVisibleLoading: Bool { get }
    var isVisibleEmpty: Bool { get }
    var isVisibleList: Bool { get }
    
    func fetchShows() async
    func fetchMoreShows(of show: Showable) async
}

final class ShowsListViewModel: ObservableObject, ShowsViewModelProtocol {
    private let getAllShows: GetAllShowsUseCaseProtocol

    init(getAllShows: GetAllShowsUseCaseProtocol = GetAllShows()) {
        self.getAllShows = getAllShows
    }
    
    var isVisibleLoading: Bool {
        return viewState == .loading
    }
    
    var isVisibleEmpty: Bool {
        return viewState == .empty
    }
    
    var isVisibleList: Bool {
        return viewState == .finish
    }
    
    private var currentPage = 0
    private var viewState: ViewState = .loading
    
    @Published private(set) var shows: [Showable] = []
    
    @MainActor
    func fetchShows() async {
        do {
            viewState = .loading
            shows = try await getAllShows.execute(page: currentPage)
            viewState = .finish
        } catch {
            viewState = shows.isEmpty ? .empty : .finish
        }
    }
    
    @MainActor
    func fetchMoreShows(of show: Showable) async {
        do {
            guard isLoadingMore(with: show) else { return }
            currentPage += 1
            let newShows = try await getAllShows.execute(page: currentPage)
            shows.append(contentsOf: newShows)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func isLoadingMore(with show: Showable) -> Bool {
        guard let last = shows.last else { return false }
        return last.id == show.id
    }
}
