//
//  RequestManager.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 27/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation
import Moya

final class RequestManager {

    static func request<T: Decodable, K: TargetType>(provider: MoyaProvider<K>,
                                                     target: K,
                                                     type: T.Type,
                                                     completion: @escaping (Result<T, Error>) -> Void) {

        provider.request(target) { (response) in

            switch response {
            case .success(let moyaResponse):

                Parser.parseResult(moyaResponse: moyaResponse, ofType: type, completion: completion)
            case .failure(let error):

                completion(.failure(error))
            }
        }
    }
}
