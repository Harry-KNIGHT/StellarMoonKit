//
//  SearchDateArticleViewModel.swift
//  Stellar
//
//  Created by Elliot Knight on 27/01/2023.
//

import Foundation


public struct SearchSingleArticleApi {
	static func searchOneArticle(date: Date) async throws -> AstronomyArticleModel  {

		let currentCalendar = Calendar.current
		let components = currentCalendar.dateComponents([.year, .day, .month], from: date)

		guard let year = components.year,
			  let day = components.day,
			  let month = components.month
		else { throw ApiError.dateError }

		let articleURL = URL(string:"https://apod.ellanan.com/api?date=\(year)-\(month)-\(day)")

		guard let articleURL else { throw ApiError.urlNotFound }

		let (data, response) = try await URLSession.shared.data(from: articleURL)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ApiError.badHttpResponse }

		do {
			return try JSONDecoder().decode(AstronomyArticleModel.self, from: data)
		} catch {
			throw error
		}
	}
}
