//
//  AllAstronomyArticlesApi.swift
//  NasaDayAstronomy
//
//  Created by Elliot Knight on 26/07/2022.
//

import Foundation

@available(macOS 12.0, *)
public struct FetchArticlesApi {
	public static func fetchArticles() async throws -> [Article] {

		// TODO: Refactorise this date part into external method or date extention.

		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"

		// 333 days in milliseconds
		let epochHundredDaysAgo: Int64 = 313_632_000_00
		let todayInMilliseconds = Date().millisecondsSince1970

		let todayMinusThreeUndred = (todayInMilliseconds - epochHundredDaysAgo)
		let threeHundredDayAgoDateType = Date(milliseconds: todayMinusThreeUndred)
		let threeHundredDayAgo = formatter.string(from: threeHundredDayAgoDateType)

		// Today time formatter
		let todayDateFormatted = formatter.string(from: Date())
	
		let url = "https://apod.ellanan.com/api?start_date=\(threeHundredDayAgo)&end_date=\(todayDateFormatted)"

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
