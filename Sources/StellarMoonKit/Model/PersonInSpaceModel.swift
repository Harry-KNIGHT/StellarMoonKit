//
//  PersonInSpaceMode.swift
//  Stellar
//
//  Created by Elliot Knight on 28/07/2022.
//

import Foundation

// MARK: - PeopleInSpaceResponse
public struct PeopleInSpaceResponse: Hashable, Codable {
	internal init(number: Int, issExpedition: Int, expeditionPatch: String, expeditionURL: String, expeditionImage: String, people: [Person]) {
		self.number = number
		self.issExpedition = issExpedition
		self.expeditionPatch = expeditionPatch
		self.expeditionURL = expeditionURL
		self.expeditionImage = expeditionImage
		self.people = people
	}

	public let number, issExpedition: Int
	public let expeditionPatch: String
	public let expeditionURL: String
	public let expeditionImage: String
	public let people: [Person]

	public enum CodingKeys: String, CodingKey {
		case number
		case issExpedition = "iss_expedition"
		case expeditionPatch = "expedition_patch"
		case expeditionURL = "expedition_url"
		case expeditionImage = "expedition_image"
		case people
	}
}

// MARK: - Person
public struct Person: Hashable, Codable {
	public let id: Int
	public let name, country, flagCode, agency: String
	public let position: String
	public let spacecraft: Spacecraft
	public let launched: Int
	public let iss: Bool
	public let daysInSpace: Int
	public let url: String
	public let image: String

	public enum CodingKeys: String, CodingKey {
		case id, name, country
		case flagCode = "flag_code"
		case agency, position, spacecraft, launched, iss
		case daysInSpace = "days_in_space"
		case url, image
	}
}

public enum Spacecraft: String, Hashable, Codable {
	case crew4Dragon = "Crew-4 Dragon"
	case shenzhou14 = "Shenzhou 14"
	case soyuzMS21 = "Soyuz MS-21"
}

extension Person {
	public static var peopleSample = Person(
		id: 1, name: "Oleg Artemyev",
								country: "Russia", flagCode: "ru",
								agency: "Roscosmos",
								position: "Commander",
								spacecraft: .soyuzMS21,
								launched: 1647615318,
								iss: true,
								daysInSpace: 361,
								url: "https://en.wikipedia.org/wiki/Oleg_Artemyev",
								image: "https://upload.wikimedia.org/wikipedia/commons/5/5a/Oleg_Artemyev_in_2021.jpg")
}
