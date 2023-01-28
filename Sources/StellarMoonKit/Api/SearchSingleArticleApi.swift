//
//  SearchDateArticleViewModel.swift
//  Stellar
//
//  Created by Elliot Knight on 27/01/2023.
//

import Foundation


public struct SearchSingleArticleApi {
	public static func searchOneArticle(date: Date) async throws -> AstronomyArticleModel  {
		let year = date.formatted(.dateTime.year(.defaultDigits))
		let month = date.formatted(.dateTime.month(.twoDigits))
		let day = date.formatted(.dateTime.day(.twoDigits))

		 let stringDate = "\(year)-\(month)-\(day)"

		 let url = "https://apod.ellanan.com/api?date=\(stringDate)"

		guard let articleURL = URL(string: url) else { throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: articleURL)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ApiError.badHttpResponse
		}

		do {
			return try JSONDecoder().decode(AstronomyArticleModel.self, from: data)
		} catch {
			throw error
		}
	}
}
