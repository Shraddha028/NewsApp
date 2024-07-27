//
//  EventList.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var viewModel: NewsListViewModel
    
    private let flexibleColumn = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: NewsListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let isLandscape = geometry.size.width > geometry.size.height
                let columns = isLandscape ? 3 : 2
                
                ScrollView{
                    if let article = viewModel.articles.first {
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            FullWidthArticleView(article: article)
                                .padding(.horizontal, 5)
                        }
                        .accentColor(.black)
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)) {
                            ForEach(viewModel.articles.dropFirst()) { article in
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    CellItemView(article: article)
                                        .frame(height:190)
                                }
                                .accentColor(.black)
                        }
                    }
                    .padding(.all, 5)
                    .navigationBarTitle(Title.news)
                    .onAppear {
                        viewModel.fetchNews()
                    }
                    .alert(isPresented: $viewModel.showError, content: {
                        Alert(title: Text(ErrorMsg.error), message: Text(viewModel.errorMessage ?? ErrorMsg.errorMessage), dismissButton: .default(Text(Button.ok)))
                    })
                }
            }
        }
    }
    var count: Int {
        return viewModel.articles.count
    }
    
}
