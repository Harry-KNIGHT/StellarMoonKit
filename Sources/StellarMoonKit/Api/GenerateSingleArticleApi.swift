//
//  SearchDateArticleViewModel.swift
//  Stellar
//
//  Created by Elliot Knight on 27/01/2023.
//

import Foundation


public struct GenerateRandomArticleApi {

	public static func generateOneArticle() async throws -> AstronomyArticleModel  {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd" // Conform to url date format

		let firstDate: Double = 1262304000 // 01/01/2010
		let today: Double = Date().timeIntervalSince1970

		let randomEpochDate = Double.random(in: firstDate..<today)

		let epochToFormattedDate = Date(timeIntervalSince1970: randomEpochDate)
		let stringDateFormat = dateFormatter.string(from: epochToFormattedDate)

		 let url = "https://apod.ellanan.com/api?date=\(stringDateFormat)"

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
