//
//  CharactersWorker.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

class CharactersWorker {

    func getCharacters(router: Router, completion: @escaping (Result<CharactersResponse>) -> ()) {
        
        let ws = Webservice.shared
        ws.request(router: router) { (result) in
            completion(result)
        }
    }
    
}
 
