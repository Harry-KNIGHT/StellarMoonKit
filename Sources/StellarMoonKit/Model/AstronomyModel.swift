//
//  AstronomyModel.swift
//  NasaAstronomy
//
//  Created by Elliot Knight on 25/07/2022.
//

import Foundation

// MARK: - Article model

public struct Article: Identifiable, Codable, Equatable {

	// MARK: Initializer

	public init(
		title: String,
		copyright: String?,
		explanation: String,
		date: String,
		serviceVersion: ServiceVersion,
		mediaType: MediaType,
		mediaUrl: String
	) {
		self.title = title
		self.copyright = copyright
		self.explanation = explanation
		self.date = date
		self.serviceVersion = serviceVersion
		self.mediaType = mediaType
		self.mediaUrl = mediaUrl
	}

	// MARK: Properties

	public var id: String { explanation }
	public let title: String
	public let copyright: String?
	public let explanation: String
	public let date: String
	public let mediaType: MediaType
	public let serviceVersion: ServiceVersion
	public let mediaUrl: String

	public enum CodingKeys: String, CodingKey {
		case title
		case copyright
		case explanation
		case date
		case serviceVersion = "service_version"
		case mediaType = "media_type"
		case mediaUrl = "url"
	}
}

// MARK: MediaType enum

public enum MediaType: String, Codable {
	case image = "image"
	case video = "video"
}

// MARK: ServiceVersion enum

public enum ServiceVersion: String, Codable {
	case v1 = "v1"
}

typealias ArticleModel = [Article]

// MARK: Article extension

extension Article {
	public static var imageArticleSample = Article(
		title: "Tycho and Clavius at Dawn",
		copyright: "Eduardo\nSchaberger Poupeau",
		explanation: "South is up in this dramatic telescopic view of the lunar terminator and the Moon's rugged southern highlands.",
		date: "2022-07-16",
		serviceVersion: .v1,
		mediaType: .image,
		mediaUrl: "https://apod.nasa.gov/apod/image/2207/Dawn-in-Clavius-Tycho-07-07-22_1024.jpg"
	)

	public static var videoArticleSample = Article(
		title: "Leaving Earth",
		copyright: "NASA/JHU Applied Physics Lab/Carnegie Inst. Washington",
		explanation: "What it would look like to leave planet Earth? Such an event was recorded visually in great detail by the MESSENGER spacecraft as it swung back past the Earth in 2005 on its way in toward the planet Mercury. Earth can be seen rotating in this time-lapse video, as it recedes into the distance. The sunlit half of Earth is so bright that background stars are not visible. The robotic MESSENGER spacecraft is now in orbit around Mercury and has recently concluded the first complete map of the surface. On occasion, MESSENGER has continued to peer back at its home world. MESSENGER is one of the few things created on the Earth that will never return. At the end of its mission MESSENGER crashed into Mercury's surface.",
		date: "2022-05-09",
		serviceVersion: .v1,
		mediaType: .video,
		mediaUrl: "https://www.youtube.com/embed/rFDjAfwmWKM?rel=0"
	)
}
