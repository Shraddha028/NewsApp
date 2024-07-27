//
//  CellItemView.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import SwiftUI

struct CellItemView: View {
    @State var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
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
                .frame(height: 100)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(article.title)
                        .font(.headline)
                        .lineLimit(1)
                    Spacer()
                    Text("3 hrs ago")
                        .font(.caption)
                }
                
                Text(article.description ?? ErrorMsg.descNotAvaiable)
                    .font(.subheadline)
                    .lineLimit(1)
                
                Text((article.source?.name.isEmpty ?? true) ? "" : "\(Title.from): \(article.source?.name ?? "")")
                    .font(.caption)
                    .lineLimit(1)
            }
            .padding(.horizontal, 5)
        }
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 2)
    }
}

