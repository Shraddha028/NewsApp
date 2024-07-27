//
//  NewsListViewModelTests.swift
//  NewsAppTests
//
//  Created by Shraddha Sutar on 27/07/24.
//

import XCTest
@testable import NewsApp

final class NewsListViewModelTests: XCTestCase {
    var viewModel: NewsListViewModel?

    override func setUpWithError() throws {
        viewModel = NewsListViewModel(newsUseCase: FetchNewsUseCase(repo: MockNewsRepositoryImpl(dataSource: MockApiDataSource())))
        viewModel?.fetchNews()
    }
    
    func testFetchData() {
        viewModel?.fetchNews()
        if let isShowError = viewModel?.showError {
            XCTAssertFalse(isShowError)
        }
    }
}
