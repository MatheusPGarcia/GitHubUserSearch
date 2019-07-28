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
    static let searchPlaceHolder = NSLocalizedString("Pesquise um usuário!",
                                                     comment: "Text used as placeholder in the search bar")

    // MARK: error messages
    static let emptySearchMessage = NSLocalizedString("Ops!\nVocê precisa colocar algum nome para realizar a pesquisa",
                                                      comment: "Text shown when user try to search without any input")

    static let userNotFounded = NSLocalizedString("Ops!\nNão foi encontrado nenhum usuário com esse nome",
                                                  comment: "Text shown when the API is unable to find a user")
}
