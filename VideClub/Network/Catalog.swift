//
//  Catalog.swift
//  VideClub
//
//  Created by Boris Chirino on 8/9/22.
//
import ModelLibrary

struct Catalog: Codable {
    private let cats: [Category]

    enum CodingKeys: String, CodingKey {
        case cats = "categories"
    }
}

extension Catalog: CatalogRepresentable {
    var categories: [CategoryRepresentable] {
        cats
    }
}
