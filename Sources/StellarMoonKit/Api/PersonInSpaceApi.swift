//
//  PeopleInSpaceApi.swift
//  Stellar
//
//  Created by Elliot Knight on 28/07/2022.
//

import Foundation

@available(macOS 12.0, *)
struct PersonInSpaceApi {
	func fetchPersonInSpace() async throws -> PeopleInSpaceResponse {
		let url = "https://corquaid.github.io/international-space-station-APIs/JSON/people-in-space.json"

		guard let url = URL(string: url) else {
			throw ApiError.urlNotFound
		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
			throw ApiError.badHttpResponse
		}
		
		do {
			return try JSONDecoder().decode(PeopleInSpaceResponse.self, from: data)
		} catch {
			throw ApiError.someThingWentWrong
		}
	}
}
