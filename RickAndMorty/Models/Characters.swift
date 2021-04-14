//
//  Characters.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

struct CharactersResponse: Codable {
    var info: Info?
    var results: [CharactersResult]?
}

struct Info: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
}

struct CharactersResult: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var image: String?
    var origin: Origin?
    var episode: [String]?
}

struct Origin: Codable {
    var name: String?
    var url: String?
}
