//
//  EventRepository.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation
import Combine

protocol NewsRepository {
    func getNews() -> Future<NewsEntity, Error>
}
