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

	// MARK: - Fetch articles dates (2022-12-25) format
	
	public var oneYearAgoApodFormat: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		// 365 days in seconds
		let epochHundredDaysAgo: Double = 315_360_00
		let todayInEpoch: Double = Date().timeIntervalSince1970

		let todayMinusOneYear = (todayInEpoch - epochHundredDaysAgo)
		let oneYearAgoDateEpochFormat: Date = Date(timeIntervalSince1970: todayMinusOneYear)
		let threeHundredDayAgoStringFormat = dateFormatter.string(from: oneYearAgoDateEpochFormat)

		return threeHundredDayAgoStringFormat
	}

	public var todayApodFormat: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		let todayDateFormatted = dateFormatter.string(from: Date())
		return todayDateFormatted
	}


}
