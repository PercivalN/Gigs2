//
//  Enums.swift
//  Gigs2
//
//  Created by Percy Ngan on 9/8/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
	case get = "GET"
	case put = "PUT"
	case post = "POST"
	case delete = "DELETE"
}

enum NetworkError: Error {
	case encodingError
	case responseError
	case otherError
	case noData
	case didNotDecode
}
