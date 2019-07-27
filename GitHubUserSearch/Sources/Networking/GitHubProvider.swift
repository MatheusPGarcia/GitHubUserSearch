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

    case user(_ user: String, page: Int)
}

extension GitHubProvider: TargetType {

    public var baseURL: URL {

        return URL(string: "https://api.github.com")!
    }

    public var path: String {

        switch self {
        case .user:

            return "/search/users"
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
        case .user(let name, let page):

            return .requestParameters(parameters: ["q": name,
                                                   "page": page,
                                                   "per_page": 100],
                                      encoding: URLEncoding(destination: .queryString))
        }
    }

    public var headers: [String: String]? {

        return nil
    }
}

private extension String {

    var urlEscaped: String {

        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
