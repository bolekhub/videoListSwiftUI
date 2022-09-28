//
//  CatalogViewModel.swift
//  VideClub
//
//  Created by Boris Chirino on 1/9/22.
//

import Foundation
import Combine
import ModelLibrary

final class CatalogViewModel: ObservableObject {
    enum ViewModelState {
        case loading, ready(Int), fail, idle
    }
    private var subscriptions = Set<AnyCancellable>()
    private lazy var api: HTTPClient = {
       return HTTPClient()
    }()
    
    @Published var stateText: String = ""
    @Published var videos: [VideoItem] = [VideoItem]()
    @Published var state: ViewModelState = .idle
    
    init() {
        $videos.sink { [weak self] items in
            self?.state = items.count > 0 ? .ready(items.count) : .fail
        }.store(in: &subscriptions)
        
        $state.sink { [weak self] st in
            switch st {
            case .loading:
                self?.stateText = "Loading data ..."
            case let .ready(videosCount):
                self?.stateText = "\(videosCount) Videos"
            case .fail:
                self?.stateText = "Ohhhps something went wrong."
            case .idle:
                self?.stateText = ""
            }
        }.store(in: &subscriptions)
    }

    func fetchList() {
        state = .loading
        api.fetchMovies()
            .catch { error -> AnyPublisher<[VideoSourceItemRepresentable], Never> in
                return Just([]).eraseToAnyPublisher()
            }
            .flatMap({ item -> AnyPublisher<[VideoItem], Never> in
                return Just(item.map { VideoItem.fromRepresentable($0) }).eraseToAnyPublisher()
            })
            .assign(to: \.videos, on: self)
            .store(in: &subscriptions)
    }
    
    deinit {
        subscriptions.removeAll()
    }
}

private extension CatalogViewModel {
    func loadingStateChange(_ state: ViewModelState) {
        switch state {
        case .ready:
            stateText = "\(videos.count) Videos"
        case .loading:
            stateText = "Loading...!"
        case .fail:
            stateText = "Something went wrong...!"
        case .idle:
            stateText = "resting...!"
        }
    }
}
