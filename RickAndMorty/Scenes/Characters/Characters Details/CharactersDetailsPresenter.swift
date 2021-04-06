//
//  CharactersDetailsPresenter.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CharactersDetailsPresentationLogic {
    func successGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.Response.Success)
    func failureGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.Response.Failure)
}

class CharactersDetailsPresenter: CharactersDetailsPresentationLogic {

    //MARK: - Variables
    weak var viewController: CharactersDetailsDisplayLogic?

    func successGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.Response.Success) {
        let item = CharactersDetails.CharactersDetailsModel.ViewModel.CharactersDetailsDisplay(
                                            name: response.characterDetails.name ?? "",
                                            status: response.characterDetails.status ?? "",
                                            species: response.characterDetails.species ?? "",
                                            type: response.characterDetails.type ?? "",
                                            gender: response.characterDetails.gender ?? "",
                                            image: response.characterDetails.image ?? "")
        let vm = CharactersDetails.CharactersDetailsModel.ViewModel.Success(items: item)
        self.viewController?.successGetCharacterDetails(response: vm)
    }
    
    func failureGetCharacterDetails(response: CharactersDetails.CharactersDetailsModel.Response.Failure) {
        let vm = CharactersDetails.CharactersDetailsModel.ViewModel.Failure(message: response.error)
        self.viewController?.failureGetCharacterDetails(response: vm)
    }
}
