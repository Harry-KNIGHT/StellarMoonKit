//
//  ApiErros.swift
//  
//
//  Created by Elliot Knight on 19/11/2022.
//

import Foundation

public enum ApiError: Error {
	case urlNotFound, dataError, badHttpResponse, someThingWentWrong, noDataForImage, cantFetchImage, dateError
}
