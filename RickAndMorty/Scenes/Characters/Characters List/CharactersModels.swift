//
//  CharactersModels.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

enum Characters {
    
    enum CharacterList {
        struct Request {
            
        }
        
        struct Response {
            
            struct Success {
                let characterList : [CharactersResult]
            }
            
            struct Failure {
                let error: String
            }
            
        }
        
        struct ViewModel {
            
            struct CharactersDisplay {
                let id: Int
                let name: String
                let status: String
                let species: String
                let type: String
                let gender: String
                let image: String
                let origin: String
                let firstEpisodeSeen: String
            }
            
            struct Success {
                let items: [CharactersDisplay]
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
    
}
