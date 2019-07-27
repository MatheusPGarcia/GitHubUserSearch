//
//  GitHubProvider.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 27/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation
import Moya

let gitHubProvider = MoyaProvider<GitHubProvider>(plugins: [NetworkLoggerPlugin(verbose: true)])

public enum GitHubProvider {

    case user(_ user: String, page: Int?)
}

extension GitHubProvider: TargetType {

    public var baseURL: URL {

        return URL(string: "https://api.github.com")!
    }

    public var path: String {

        switch self {
        case .user(let userName, _):

            return "/search/users?q=\(userName)"
        }
    }

    public var method: Moya.Method {

        switch self {
        case .user:

            return .get
        }
    }

    public var sampleData: Data {

        return "sample data".data(using: .utf8)!
    }

    public var task: Task {

        switch self {
        case .user(_, let page):

            guard let pageNumber = page else { return .requestPlain }
            return .requestParameters(parameters: ["page": pageNumber,
                                                   "per_page": 100],
                                      encoding: URLEncoding(destination: .queryString))
        }
    }

    public var headers: [String: String]? {

        return nil
    }
}
