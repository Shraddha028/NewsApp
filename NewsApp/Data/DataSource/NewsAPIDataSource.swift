//
//  EventApiDataImpl.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
import Combine

class NewsAPIDataSource: NewsRepository {
    
    func getNews() -> Future<NewsEntity, Error> {
        return NetworkManager.shared.getData(endpoint: Endpoint.newList, type: NewsEntity.self)
    }

}
