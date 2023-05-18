//
//  Date.swift
//  
//
//  Created by Elliot Knight on 02/12/2022.
//

import Foundation

extension Date {
	public var randomDate: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd" // Conform to url date format

		let firstDate: Double = 1262304000 // 01/01/2010
		let today: Double = Date().timeIntervalSince1970

		let randomEpochDate = Double.random(in: firstDate..<today)

		let epochToFormattedDate = Date(timeIntervalSince1970: randomEpochDate)
		let stringDateFormat = dateFormatter.string(from: epochToFormattedDate)

		return stringDateFormat
	}

	// MARK: - Fetch articles from one date in days.

	public func daysAgo(_ daysInterval: Double) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let oneDayInSec: Double = 86400

		// Convert days in seconds for epoch format
		let dayIntervalInSeconds: Double = (oneDayInSec * daysInterval)
		let todayInEpoch: Double = Date().timeIntervalSince1970

		let daysIntervalInSecondsMinusTodayInEpoch = (todayInEpoch - dayIntervalInSeconds)
		let daysIntervalAgoEpochFormat: Date = Date(timeIntervalSince1970: daysIntervalInSecondsMinusTodayInEpoch)
		let convertEpochToStringformat = dateFormatter.string(from: daysIntervalAgoEpochFormat)

		return convertEpochToStringformat
	}
}
