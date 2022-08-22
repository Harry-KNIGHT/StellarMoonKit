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

extension NasaAstronomyResponse {
	public static var astronomySample = NasaAstronomyResponse(copyright: "Mohamad Soltanolkotabi", date: "2022-07-25", explanation:  "Can you find the Moon? This usually simple task can be quite difficult.  Even though the Moon is above your horizon half of the time, its phase can be anything from crescent to full. The featured image was taken in late May from Sant Martí d'Empúries, Spain, over the Mediterranean Sea in the early morning. One reason you can't find this moon is because it is very near to its new phase, when very little of the half illuminated by the Sun is visible to the Earth. Another reason is because this moon is near the horizon and so seen through a long path of Earth's atmosphere -- a path which dims the already faint crescent. Any crescent moon is only visible near the direction the Sun, and so only locatable near sunrise of sunset. The Moon runs through all of its phases in a month (moon-th), and this month the thinnest sliver of a crescent -- a new moon -- will occur in three days.", hdurl: "https://apod.nasa.gov/apod/image/2207/FindTheMoon_soltanolkotabi_1500.jpg", mediaType: "image", serviceVersion: "v1", title: "Find the New Moon", url: "https://apod.nasa.gov/apod/image/2207/FindTheMoon_soltanolkotabi_1080.jpg")
}
