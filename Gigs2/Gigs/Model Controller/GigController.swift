//
//  GigController.swift
//  Gigs2
//
//  Created by Percy Ngan on 9/8/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import Foundation

class GigController {

	// MARK: - Properties

	var bearer: Bearer?

	let baseURL = URL(string: "https://lambdagigs.vapor.cloud/api")!


	// Sign Up

	func signUp(with user: User, completion: @escaping (NetworkError?) -> Void) {

		let signUpURL = baseURL.appendingPathComponent("users/signup")

		var request = URLRequest(url: signUpURL)
		request.httpMethod = HTTPMethod.post.rawValue
		request.setValue("spplication/json", forHTTPHeaderField: <#T##String#>)
	}

	// Log In

	// Create Gigs

	// Fetch Gigs



}



