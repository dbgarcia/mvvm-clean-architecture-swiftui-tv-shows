//
//  ContentView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        TabView {
            
            TVShowsView(viewModel: ShowsListViewModel())
                .tabItem {
                    Label("Shows", systemImage: "tv")
                }
            
            SearchView(viewModel: SearchViewModel())
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
