//
//  VideoItem.swift
//  VideClub
//
//  Created by Boris Chirino on 8/9/22.
//

import Foundation
import ModelLibrary

struct VideoItem: Identifiable {
    var id: UUID = UUID()
    var thumbnail: String
    var title: String
    var subtitle: String
    var description: String
    var sources: [String]
}

extension VideoItem {
    static func fromRepresentable(_ rep: VideoSourceItemRepresentable) -> VideoItem {
        let video = VideoItem(thumbnail: rep.thumbnail,
                              title: rep.title,
                              subtitle: rep.subtitle,
                              description: rep.description,
                              sources: rep.sources)
        return video
    }
}

extension VideoItem: VideoSourceItemRepresentable {}
