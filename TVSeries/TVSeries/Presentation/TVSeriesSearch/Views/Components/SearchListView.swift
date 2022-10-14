//
//  SearchListView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 12/09/22.
//

import SwiftUI

struct SearchListView: View {
    var shows: [Showable]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(shows, id: \.id) { show in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(show: show))) {
                        TVShowRowView(show: show)
                    }
                }
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(shows: [])
    }
}
