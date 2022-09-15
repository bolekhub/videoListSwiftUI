//
//  NetworkService.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import Combine
import Foundation
import ModelLibrary

protocol HTTPClientProtocol {
    func fetchMovies() -> AnyPublisher<[VideoSourceItemRepresentable], Error>
}

struct HTTPClient: HTTPClientProtocol {
    private let endpointURL = "https://gist.githubusercontent.com/deepakpk009/99fd994da714996b296f11c3c371d5ee/raw/28c4094ae48892efb71d5122c1fd72904088439b/media.json"
    
    private let session: URLSession = URLSession.shared
    private let jsonDecoder = JSONDecoder()

    func fetchMovies() -> AnyPublisher<[VideoSourceItemRepresentable], Error> {
        return loadMovies()
    }

    private func loadMovies() -> AnyPublisher<[VideoSourceItemRepresentable], Error> {
        guard let url = URL(string: endpointURL) else {
            return Empty().eraseToAnyPublisher()
        }
        let request = URLRequest(url: url,
                                 cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad,
                                 timeoutInterval: 2)
        return session
            .dataTaskPublisher(for: request)
            .retry(2)
            .tryMap() {
               guard $0.data.count > 0 else {
                   throw URLError(.zeroByteResource)
               }
                return $0.data
            }
            .decode(type: Catalog.self, decoder: jsonDecoder)
            .compactMap({ cat ->  [VideoSourceItemRepresentable] in
                return cat.categories.first?.videos ?? []
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
