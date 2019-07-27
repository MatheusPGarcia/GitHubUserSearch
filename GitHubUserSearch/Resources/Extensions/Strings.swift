//
//  Strings.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

extension String {

    // MARK: - UserSearch strings

    // MARK: error messages
    static let emptySearchMessage = NSLocalizedString("Ops, você precisa colocar algum nome para realizar a pesquisa",
                                                      comment: "Text shown when user try to search without any input")

    static let userNotFounded = NSLocalizedString("Ops, não foi encontrado nenhum usuário com esse nome",
                                                  comment: "Text shown when the API is unable to find a user")
}
