//
//  CharactersPresenter.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol CharactersPresentationLogic {
    func successGetCharacters(response: Characters.CharacterList.Response.Success)
    func failureGetCharacters(response: Characters.CharacterList.Response.Failure)
}

class CharactersPresenter: CharactersPresentationLogic {

    // Var's
    weak var viewController: CharactersDisplayLogic?

    func successGetCharacters(response: Characters.CharacterList.Response.Success) {
        let item = response.characterList.compactMap {
            Characters.CharacterList.ViewModel.CharactersDisplay(
                id: $0.id ?? -1,
                gender: $0.gender ?? "",
                url: $0.url ?? "")
        }
        let vm = Characters.CharacterList.ViewModel.Success(items: item)
        self.viewController?.successGetCharacters(response: vm)
    }
    
    func failureGetCharacters(response: Characters.CharacterList.Response.Failure) {
        let vm = Characters.CharacterList.ViewModel.Failure(message: response.error)
        self.viewController?.failureGetCharacters(response: vm)
    }
}
