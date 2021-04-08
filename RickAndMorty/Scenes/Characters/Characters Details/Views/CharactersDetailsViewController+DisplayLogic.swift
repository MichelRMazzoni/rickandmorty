//
//  CharactersDetailsViewController+DisplayLogic.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CharactersDetailsDisplayLogic: class {
    func successGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.ViewModel.Success)
    func failureGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.ViewModel.Failure)
}

extension CharactersDetailsViewController: CharactersDetailsDisplayLogic {
    
    func successGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.ViewModel.Success) {
        setupLabels(response: response)
        Indicator.sharedInstance.hideIndicator()
    }
    
    func failureGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.ViewModel.Failure) {
        print(response.message)
    }
    
    private func setupLabels(response: CharactersDetails.CharactersDetailsModel.ViewModel.Success) {
        labelName.text = response.items.name
        labelStatus.text = response.items.status
        labelSpecies.text = response.items.species
        labelType.text = response.items.type
        labelGender.text = response.items.gender
        labelImage.text = response.items.image
        imageCharacter.loadImage(withUrl: response.items.image)
    }
    
    func showLoading() {
        loadingIndicator.isAnimating = true
    }
    
    func hideLoading() {
        loadingIndicator.isAnimating = false
    }
}
