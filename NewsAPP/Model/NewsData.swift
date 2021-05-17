//
//  NewsData.swift
//  NewsAPP
//
//  Created by Milton Orellana on 15/05/2021.
//

import Foundation

struct NewsData: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
