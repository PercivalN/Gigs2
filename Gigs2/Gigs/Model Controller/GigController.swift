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
		request.setValue("application/json", forHTTPHeaderField: "Conttent-Type")


	let encoder = JSONEncoder()

	do {

		let userData = try encoder.encode(user)
		request.httpBody = userData
		print(userData)

	} catch {
		NSLog("Error encoding user: \(error)")
		completion(.encodingError)
		return
	}

		URLSession.shared.dataTask(with: request) { (data, response, error) in

			if let response = response as? HTTPURLResponse,
				response.statusCode != 200 {
				completion(.responseError)
				return
			}

			if let error = error {
				NSLog("Error creating user on server: \(error)")
				completion(.otherError)
				return
			}
			completion(nil)
		}.resume()
	}

	// Log In

	func login(with user: User, completion: @escaping (NetworkError?) -> Void) {

		let loginURL = baseURL.appendingPathComponent("users").appendingPathComponent("login")

		var request = URLRequest(url: loginURL)
		request.httpMethod = HTTPMethod.post.rawValue
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		let jsonEncoder = JSONEncoder()

		do {
			request.httpBody = try jsonEncoder.encode(user)
		} catch {
			NSLog("")
			completion(.encodingError)
			return
		}


		// Perform the request

		URLSession.shared.dataTask(with: request) { (data, response, error) in

			if let response = response as? HTTPURLResponse,
				response.statusCode != 200 {
				completion(.responseError)
				return
			}

			if let error = error {
				NSLog("Error logging in: \(error)")
				completion(.otherError)
				return
			}

			guard let data = data else {
				completion(.noData)
				return
			}

			do {
				let bearer = try JSONDecoder().decode(Bearer.self, from: data)
				self.bearer = bearer

			} catch {
				completion(.didNotDecode)
				return
			}

			completion(nil)
		}.resume()


	}



	// Create Gigs

	// Fetch Gigs


}



