//
//  EventListViewModel.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
import Combine

class NewsListViewModel: ObservableObject {

    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var newsUseCase: FetchNewsUseCase
    
    init(newsUseCase: FetchNewsUseCase) {
        self.newsUseCase = newsUseCase
        fetchNews()
    }
    
    func fetchNews() {
        newsUseCase.getNews()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { result in
                self.articles = result.articles
            }
            .store(in: &cancellables)
    }
}
