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
    var characterList: [CharactersResult] { get }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {

    // Var's
    var presenter: CharactersPresentationLogic?
    let worker = CharactersWorker()
    var characterList = [CharactersResult]()

    func getCharacters(request: Characters.CharacterList.Request) {
        worker.getCharacters(router: Router.getCharacterDetails) { (result: Result<CharactersResponse>) in
            switch result {
            case .success(let characterList):
                self.characterList = characterList.results ?? []
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
