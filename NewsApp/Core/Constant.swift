//
//  Constant.swift
//  NewsApp
//
//  Created by Shraddha Sutar on 27/07/24.
//

import Foundation

enum Title {
    static let news = "News"
    static let articleDetails = "Article Details"
    static let from = "From"
}

enum Button {
    static let ok = "OK"
}

enum ErrorMsg {
    static let error = "Error"
    static let errorMessage = "Something went wrong"
    static let descNotAvaiable = "Description Not Available"
}

enum Endpoint {
    static let newList = "https://newsapi.org/v2/top-headlines?country=us&apiKey=dc0cddec04da46faa4a5de14aced5cfd"
}
