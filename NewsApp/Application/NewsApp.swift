//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            //NewsListView()
            let apiDataSource = NewsAPIDataSource()
            let newsRepository = NewsRepositoryImpl(dataSource: apiDataSource)
            let newsUseCase = FetchNewsUseCase(repo: newsRepository)
            let newsViewModel = NewsListViewModel(newsUseCase: newsUseCase)
            NewsListView(viewModel: newsViewModel)
        }
    }
}
