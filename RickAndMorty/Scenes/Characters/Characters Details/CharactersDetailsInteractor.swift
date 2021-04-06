//
//  CharactersDetailsInteractor.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CharactersDetailsBusinessLogic {
    func getCharacterDetails(request: CharactersDetails.CharactersDetailsModel.Request)
}

protocol CharactersDetailsDataStore {

}

class CharactersDetailsInteractor: CharactersDetailsBusinessLogic, CharactersDetailsDataStore {

    //MARK: - Variables
    var presenter: CharactersDetailsPresentationLogic?
    let worker = CharactersDetailsWorker()
    
    func getCharacterDetails(request: CharactersDetails.CharactersDetailsModel.Request) {
        worker.getCharacterDetails(router: RouterCharacters.getCharacterDetails(id: request.id)) { (result: Result<CharactersDetailsResult>) in
            switch result {
            case .success(let characterDetails):
                let response = CharactersDetails.CharactersDetailsModel.Response.Success(characterDetails: characterDetails)
                self.presenter?.successGetCharacterDetails(response: response)
            case .failure(let error):
                let response = CharactersDetails.CharactersDetailsModel.Response.Failure(error: error.localizedDescription)
                self.presenter?.failureGetCharacterDetails(response: response)
                print("RESULT ERROR = \(error.localizedDescription)")
            }
            
        }
    }

}
