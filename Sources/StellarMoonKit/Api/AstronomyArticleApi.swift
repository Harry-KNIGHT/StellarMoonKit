//
//  AstronomyArticleApi.swift
//  NasaAstronomy
//
//  Created by Elliot Knight on 25/07/2022.
//

import Foundation


enum ApiError: Error {
	case urlNotFound, dataError, badHttpResponse, someThingWentWrong, noDataForImage
}

@available(macOS 12.0, *)
public struct AstronomyApi {

	public static func nasaApi() async throws -> NasaAstronomyResponse {
		let url = "https://api.nasa.gov/planetary/apod?api_key=wHAZImKgLhzz4TzarBAWeznXG1TOSiUh3DqnrobZ"
		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
			throw ApiError.badHttpResponse
		}

		do {
			return  try JSONDecoder().decode(NasaAstronomyResponse.self, from: data)
		} catch {
			print("Error: \(error.localizedDescription)")
			throw ApiError.someThingWentWrong
		}
	}
}
