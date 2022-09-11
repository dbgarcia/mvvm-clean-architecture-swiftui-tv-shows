//
//  LoadingView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
    }
}
