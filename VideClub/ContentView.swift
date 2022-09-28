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
    @StateObject private var viewModel: CatalogViewModel = CatalogViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.stateText)
            NavigationView {
                List(viewModel.videos) { item in
                    NavigationLink {
                        VideoView(videoItem: item)
                    } label: {
                        GridCell(videoItem: item)
                    }
                }.navigationTitle("Videos")
            }
        }.onAppear {
            viewModel.fetchList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
