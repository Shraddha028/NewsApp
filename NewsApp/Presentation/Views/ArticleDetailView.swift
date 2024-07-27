//
//  ArticleDetailView.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Rectangle()
                    .fill(Color.gray)
                    .overlay(content: {
                        AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Image(.noImageAvailable)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                    })
                    .frame(height: 200)
                
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(article.description ?? ErrorMsg.descNotAvaiable)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(Title.articleDetails)
    }
}
