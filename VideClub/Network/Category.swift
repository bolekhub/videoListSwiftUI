//
//  Category.swift
//  VideClub
//
//  Created by Boris Chirino on 8/9/22.
//

import ModelLibrary

struct Category: Codable {
    let name: String
    private let vid: [VideoSourceItem]
    
    enum CodingKeys: String, CodingKey {
        case name
        case vid = "videos"
    }
}

extension Category: CategoryRepresentable {
    var videos: [VideoSourceItemRepresentable] {
        vid
    }
}
