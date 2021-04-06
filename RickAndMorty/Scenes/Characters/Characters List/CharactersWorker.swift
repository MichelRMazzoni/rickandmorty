//
//  CharactersWorker.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

class CharactersWorker {

    func getCharacters(router: RouterEnum, completion: @escaping (Result<CharactersResponse>) -> ()) {

        Webservice.shared.request(router: router) { (result) in
            completion(result)
        }
    }
    
}
 
