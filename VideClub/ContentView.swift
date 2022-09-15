//
//  ContentView.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import SwiftUI
import Combine
import ModelLibrary

struct ContentView: View {
    @ObservedObject private var contentViewModel: CatalogViewModel = CatalogViewModel()
    
    init() {
        contentViewModel.fetchList()
    }
    
    var body: some View {
        Text(contentViewModel.stateText ?? "" )
        NavigationView {
            List {
                ForEach(contentViewModel.videos) { videoItem in
                    GridCell(videoItem: videoItem)
                    NavigationLink {
                        VideoView(videoItem: videoItem)
                    } label: {
                        Text(videoItem.subtitle)
                    }.navigationTitle("Videos")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        ContentView()
            .environment(\.colorScheme, .dark)
        }
    }
}
