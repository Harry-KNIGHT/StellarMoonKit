//
//  AllAstronomyArticlesApi.swift
//  NasaDayAstronomy
//
//  Created by Elliot Knight on 26/07/2022.
//

import Foundation

@available(macOS 12.0, *)
public struct AstronomiesArticleApi {

	public static func fetchAstronomiesObject(from hundredDayBefore: Int64 = Date().millisecondsSince1970 , to today: Date) async throws -> [AstronomyArticleModel] {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"

		//100 days ago converter
		let epochHundredDaysAgo: Int64 = (10454400000)// 111 days in milliseconds
		let todayMinusHundredDay = (hundredDayBefore - epochHundredDaysAgo)
		let hundredDayAgoDateType = Date(milliseconds: todayMinusHundredDay)
		let hundredDayAgo = formatter.string(from: hundredDayAgoDateType)

		// Today time converter
		let  today = Date()

		let dateString = formatter.string(from: today)
		print(dateString)

	
		let url = "https://apod.ellanan.com/api?start_date=\(hundredDayAgo)&end_date=\(dateString)"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}
		let (data, response) = try await URLSession.shared.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
			throw ApiError.badHttpResponse
		}

		do {
			return try JSONDecoder().decode([AstronomyArticleModel].self, from: data)
		} catch {
			throw ApiError.someThingWentWrong
		}
	}
}
