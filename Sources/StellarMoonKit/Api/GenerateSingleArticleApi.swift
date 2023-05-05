//
//  SearchDateArticleViewModel.swift
//  Stellar
//
//  Created by Elliot Knight on 27/01/2023.
//

import Foundation

public protocol GenerateRandomArticleClient {
	static func generateOneArticle() async throws -> Article
}

@available(macOS 12.0, *)
public struct GenerateRandomArticleApi: GenerateRandomArticleClient {
	public static func generateOneArticle() async throws -> Article {
		let url = "https://apod.ellanan.com/api?date=\(Date.now.randomDate)"

		guard let articleURL = URL(string: url) else { throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: articleURL)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ApiError.badHttpResponse
		}

		do {
			return try JSONDecoder().decode(Article.self, from: data)
		} catch {
			throw error
		}
	}
}
