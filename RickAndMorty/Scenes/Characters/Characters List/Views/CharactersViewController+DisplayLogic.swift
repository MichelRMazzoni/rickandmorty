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
        list = response.items
        tableView.reloadData()
        LoadingView.sharedInstance.hideIndicator()
    }
    
    func failureGetCharacters(response: Characters.CharacterList.ViewModel.Failure) {
        print(response)
    }

}
