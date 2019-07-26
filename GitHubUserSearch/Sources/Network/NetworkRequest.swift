//
//  NetworkRequest.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

class NetworkRequest {

    static func fetch(url: URL, completion: @escaping (Swift.Result<(Data), Error>) -> Void) {

        let request = URLRequest(url: url)

        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)

        session.dataTask(with: request) { (data, _, error) in

            if let error = error {

                completion(.failure(error))
            }

            if let data = data {

                completion(.success(data))
            }
        }.resume()
    }
}
