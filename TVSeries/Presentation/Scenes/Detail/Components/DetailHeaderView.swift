//
//  DetailHeaderView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailHeaderView: View {
    var show: Showable
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: show.image?.toImageURL()) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Text(show.name)
                .tint(Color.primary)
                .font(.headline)
            
            Text(show.toGenresFormated())
                .fontWeight(.thin)
                .font(.footnote)
                .tint(Color.primary)
        }
    }
}
