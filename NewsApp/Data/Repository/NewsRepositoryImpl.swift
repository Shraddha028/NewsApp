//
//  EventRepositoryImpl.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
import Combine

struct NewsRepositoryImpl: NewsRepository {
    var dataSource: NewsRepository
    
    func getNews() -> Future<NewsEntity, Error> {
        return dataSource.getNews()
    }
}
