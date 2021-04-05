//
//  Characters.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

struct CharactersResponse: Codable {
    var results: [CharactersResult]?
}

struct CharactersResult: Codable {
    var id: Int?
    var gender: String?
    var url: String?
}
