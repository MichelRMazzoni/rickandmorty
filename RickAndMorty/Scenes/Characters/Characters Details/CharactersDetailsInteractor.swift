//
//  CharactersDetailsInteractor.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CharactersDetailsBusinessLogic {

}

protocol CharactersDetailsDataStore {

}

class CharactersDetailsInteractor: CharactersDetailsBusinessLogic, CharactersDetailsDataStore {

    //MARK: - Variables
    var presenter: CharactersDetailsPresentationLogic?
    let worker = CharactersDetailsWorker()

}
