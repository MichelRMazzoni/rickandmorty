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
            
        }
        
        struct Response {
            
            struct Success {
                
            }
            
            struct Failure {
                let error: String
            }
            
        }
        
        struct ViewModel {
            
            struct CharactersDetailsDisplay {
                
            }
            
            struct Success {
                
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
}
