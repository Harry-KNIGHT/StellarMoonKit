//
//  AllAstronomyArticlesApi.swift
//  NasaDayAstronomy
//
//  Created by Elliot Knight on 26/07/2022.
//

import Foundation

public protocol FetchArticleClient {
	static func fetchArticles() async throws -> [Article]
}

@available(macOS 12.0, *)
public struct FetchArticlesApi: FetchArticleClient {
	public static func fetchArticles() async throws -> [Article] {
		let url = "https://apod.ellanan.com/api?start_date=\(Date.now.oneYearAgoApodFormat)"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}

		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
			throw ApiError.badHttpResponse
		}

		do {
			return try JSONDecoder().decode([Article].self, from: data)
		} catch {
			throw ApiError.someThingWentWrong
		}
	}
}
