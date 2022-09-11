//
//  DetailView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            DetailHeaderView(show: viewModel.show)
            DetailMiddleView(show: viewModel.show)
            
            ZStack {
                DetailEpisodesView(episodes: viewModel.episodes)
                    .visiblity(viewModel.viewState == .finish)
                
                EmptyView(systemName: "exclamationmark.triangle.fill", message: "Empty Episodes...")
                    .visiblity(viewModel.viewState == .empty)
                    .hidden()
                
                LoadingView()
                    .visiblity(viewModel.viewState == .loading)
                    .task {
                        await viewModel.fetchEpisodes()
                    }
            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
    }
}
