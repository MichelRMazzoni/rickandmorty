//
//  CharactersInteractor.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol CharactersBusinessLogic {
    func getCharacters(request: Characters.CharacterList.Request)
}

protocol CharactersDataStore {

}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {

    // Var's
    var presenter: CharactersPresentationLogic?
    let worker = CharactersWorker()

    func getCharacters(request: Characters.CharacterList.Request) {
        
        worker.getCharacters(router: RouterCharacters.getCharactersList) { (result: Result<CharactersResponse>) in
            switch result {
            case .success(let characterList):
                let response = Characters.CharacterList.Response.Success(characterList: characterList.results ?? [])
                self.presenter?.successGetCharacters(response: response)
            case .failure(let error):
                let response = Characters.CharacterList.Response.Failure(error: error.localizedDescription)
                self.presenter?.failureGetCharacters(response: response)
                print("RESULT ERROR = \(error.localizedDescription)")
            }
            
        }
            
    }
}
