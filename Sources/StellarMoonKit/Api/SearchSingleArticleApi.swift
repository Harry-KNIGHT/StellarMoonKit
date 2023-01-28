//
//  SearchDateArticleViewModel.swift
//  Stellar
//
//  Created by Elliot Knight on 27/01/2023.
//

import Foundation


public struct generateRandomArticleApi {
	public static func searchOneArticle() async throws -> AstronomyArticleModel  {
		let randomYear = Int.random(in: 2000...2022)
		let randomMonth = Int.random(in: 01...12)
		let randomDay = Int.random(in: 01...30)

		let stringDate = String(format: "%04d-%02d-%02d", randomYear, randomMonth, randomDay)

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
