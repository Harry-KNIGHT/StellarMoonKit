//
//  AstronomyModel.swift
//  NasaAstronomy
//
//  Created by Elliot Knight on 25/07/2022.
//

import Foundation

public struct AstronomyArticleModel: Codable {
	public init(copyright: String?, date: String, explanation: String, hdurl: String?, mediaType: MediaType, serviceVersion: ServiceVersion, title: String, url: String) {
		self.copyright = copyright
		self.date = date
		self.explanation = explanation
		self.hdurl = hdurl
		self.mediaType = mediaType
		self.serviceVersion = serviceVersion
		self.title = title
		self.url = url
	}

	public let copyright: String?
	public let date, explanation: String
	public let hdurl: String?
	public let mediaType: MediaType
	public let serviceVersion: ServiceVersion
	public let title: String
	public let url: String

	public enum CodingKeys: String, CodingKey {
		case copyright, date, explanation, hdurl
		case mediaType = "media_type"
		case serviceVersion = "service_version"
		case title, url
	}
}

public enum MediaType: String, Codable {
	case image = "image"
	case video = "video"
}

public enum ServiceVersion: String, Codable {
	case v1 = "v1"
}

typealias ArticleModel = [AstronomyArticleModel]


extension AstronomyArticleModel {
	public static var astronomySample = AstronomyArticleModel(copyright: "Eduardo\nSchaberger Poupeau",
															  date: "2022-07-16",
															  explanation: "South is up in this dramatic telescopic view of the lunar terminator and the Moon's rugged southern highlands.",
															  hdurl: "https://apod.nasa.gov/apod/image/2207/Dawn-in-Clavius-Tycho-07-07-22.jpg",
															  mediaType: .image,
															  serviceVersion: .v1,
															  title: "Tycho and Clavius at Dawn",
															  url: "https://apod.nasa.gov/apod/image/2207/Dawn-in-Clavius-Tycho-07-07-22_1024.jpg")
}
