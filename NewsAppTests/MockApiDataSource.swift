//
//  MockApiDataSource.swift
//  NewsAppTests
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
@testable import NewsApp
import Combine

class MockApiDataSource: NewsRepository {
    
    func getNews() -> Future<NewsEntity, Error> {
        return Future  { promise in
            promise(.success(NewsEntity(status: "", totalResults: 10, articles: [Article(source: Source(id: "google-news", name: "Google News"), author: "The Wall Street Journal", title: "U.S. Accuses Prominent Short Seller Andrew Left of Fraud - The Wall Street Journal", description: "", url: "https://news.google.com/rss/articles/CBMioAFBVV95cUxQeWttenFhdFBnZ3lMM19ranFpaFVyeDRaOG1seGR4Z0FTSHRMQjBpR2tlMXotUnFuVnVJOUVORFA3MWVDaWR2RkF5Q2VhMGx6Y2dRU2NkRld2RzMwX0wzcGQxYUNyZGhDSUl0RDFlb01RVUpoeDRXSVBRNmR4b3BjWTNiZlZzb294b3dINmtKOEt6OUU2Q3BYTDFndnk0N3BG?oc=5", urlToImage: "", publishedAt: "", content: "")])))
        }
    }
}

struct MockNewsRepositoryImpl: NewsRepository {
    var dataSource: NewsRepository
    
    func getNews() -> Future<NewsEntity, Error> {
        return dataSource.getNews()
    }
}
