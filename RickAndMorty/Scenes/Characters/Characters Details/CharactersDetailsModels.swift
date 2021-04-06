//
//  CharactersDetailsModels.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum CharactersDetails {

    enum CharactersDetailsModel {
        struct Request {
            var id: Int
        }
        
        struct Response {
            
            struct Success {
                let characterDetails: CharactersDetailsResult
            }
            
            struct Failure {
                let error: String
            }
            
        }
        
        struct ViewModel {
            
            struct CharactersDetailsDisplay {
                var name: String
                var status: String
                var species: String
                var type: String
                var gender: String
                var image: String
                
            }
            
            struct Success {
                let items: CharactersDetailsDisplay
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
}
