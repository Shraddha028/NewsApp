//
//  FetchNewsUseCase.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
import Combine

struct FetchNewsUseCase: NewsRepository {
    var repo: NewsRepository
    
    func getNews() -> Future<NewsEntity, Error> {
        repo.getNews()
    }
}
