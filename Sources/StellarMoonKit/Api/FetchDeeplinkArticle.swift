//
//  FetchDeeplinkArticle.swift
//  
//
//  Created by Elliot Knight on 05/03/2023.
//

import Foundation

public struct FetchDeeplinkArticle {
	public static func fetchDeeplinkArticle(date: String) async throws -> Article {
		let url = "https://apod.ellanan.com/api?date=\(date)"

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
