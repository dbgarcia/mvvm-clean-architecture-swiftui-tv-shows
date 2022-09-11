//
//  TVShowsView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct TVShowsView: View {
    @StateObject var viewModel: ShowsListViewModel
    
    var body: some View {
        ZStack {
            EmptyView(systemName: "exclamationmark.triangle.fill", message: "Empty TV Shows...")
                .visiblity(viewModel.viewState == .empty)
            
            LoadingView()
                .visiblity(viewModel.viewState == .loading)
                .task {
                    await viewModel.fetchAll()
                }
            
            TVShowListView(shows: viewModel.shows)
                .visiblity(viewModel.viewState == .finish)
        }
    }
}
