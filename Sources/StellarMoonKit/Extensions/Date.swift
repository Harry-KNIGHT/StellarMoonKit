//
//  Date.swift
//  
//
//  Created by Elliot Knight on 02/12/2022.
//

import Foundation

extension Date {
	public var millisecondsSince1970: Int64 {
		Int64((self.timeIntervalSince1970 * 1000.0).rounded())
	}

	public init(milliseconds: Int64) {
		self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
	}

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
}
