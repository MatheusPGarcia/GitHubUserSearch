//
//  Collections.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 28/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

extension Collection {

    subscript (safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
