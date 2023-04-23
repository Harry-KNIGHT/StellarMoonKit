//
//  AstronomyModel.swift
//  NasaAstronomy
//
//  Created by Elliot Knight on 25/07/2022.
//

import Foundation

public struct Article: Hashable, Codable {
	public init(
		copyright: String?,
		date: String,
		explanation: String,
		mediaType: MediaType,
		serviceVersion: ServiceVersion,
		title: String,
		mediaUrl: String
	) {
		self.copyright = copyright
		self.date = date
		self.explanation = explanation

		self.mediaType = mediaType
		self.serviceVersion = serviceVersion
		self.title = title
		self.mediaUrl = mediaUrl
	}
	public let copyright: String?
	public let date, explanation: String

	public let mediaType: MediaType
	public let serviceVersion: ServiceVersion
	public let title: String
	public let mediaUrl: String

	public enum CodingKeys: String, CodingKey {
		case copyright, date, explanation
		case mediaType = "media_type"
		case serviceVersion = "service_version"
		case title
		case mediaUrl = "url"
	}
}

public enum MediaType: String, Codable {
	case image = "image"
	case video = "video"
}

public enum ServiceVersion: String, Codable {
	case v1 = "v1"
}

typealias ArticleModel = [Article]

extension Article {
	public static var articleSample = Article(
		copyright: "Eduardo\nSchaberger Poupeau",
		date: "2022-07-16",
		explanation: "South is up in this dramatic telescopic view of the lunar terminator and the Moon's rugged southern highlands.",
		mediaType: .image,
		serviceVersion: .v1,
		title: "Tycho and Clavius at Dawn",
		mediaUrl: "https://apod.nasa.gov/apod/image/2207/Dawn-in-Clavius-Tycho-07-07-22_1024.jpg")
}
