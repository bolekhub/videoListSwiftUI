//
//  VideoView.swift
//  VideClub
//
//  Created by Boris Chirino on 7/9/22.
//

import SwiftUI
import AVKit
import ModelLibrary

struct VideoView: View, ShapeStyle {
    var videoItem: VideoSourceItemRepresentable

    var body: some View {
        VStack {
            Text(videoItem.title)
                .font(.headline)
                .padding(.top)
            VideoPlayer(player: AVPlayer(url:  URL(string: videoItem.sources.first!)!)) {
            }
            .scenePadding()
            Text(videoItem.description)
                .font(.caption)
                .padding()
        }.border(self, width: 4.0)
    }
}
