//
//  AstronomyModel.swift
//  NasaAstronomy
//
//  Created by Elliot Knight on 25/07/2022.
//

import Foundation

public struct NasaAstronomyResponse: Hashable, Codable {
	internal init(copyright: String?, date: String, explanation: String, hdurl: String?, mediaType: String, serviceVersion: String, title: String, url: String) {
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
	public let mediaType, serviceVersion, title: String
	public let url: String

	public enum CodingKeys: String, CodingKey {
		case copyright, date, explanation, hdurl
		case mediaType = "media_type"
		case serviceVersion = "service_version"
		case title, url
	}
}
