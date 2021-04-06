//
//  CharactersViewController+DisplayLogic.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol CharactersDisplayLogic: class {
    func successGetCharacters(response: Characters.CharacterList.ViewModel.Success)
    func failureGetCharacters(response: Characters.CharacterList.ViewModel.Failure)
}

extension CharactersViewController: CharactersDisplayLogic {
    
    func successGetCharacters(response: Characters.CharacterList.ViewModel.Success) {
        setupLabels(response: response)
    }
    
    func failureGetCharacters(response: Characters.CharacterList.ViewModel.Failure) {
        print(response)
    }
    
    func setupLabels(response: Characters.CharacterList.ViewModel.Success) {
        labelId.text = "\(response.items[0].id)"
        labelName.text = response.items[0].url
        labelGender.text = response.items[0].gender
    }
}
