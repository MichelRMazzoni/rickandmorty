//
//  CharactersDetailsWorker.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CharactersDetailsWorker {
    func getCharacterDetails(router: RouterEnum, completion: @escaping (Result<CharactersDetailsResult>) -> ()) {
        
        Webservice.shared.request(router: router) { (result) in
            completion(result)
        }
    }
    
}
