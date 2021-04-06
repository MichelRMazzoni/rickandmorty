//
//  CharactersDetailsConfigurator.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension CharactersDetailsViewController {

    //MARK: - Setup
    func setup() {

        let viewController          = self
        let interactor              = CharactersDetailsInteractor()
        let presenter               = CharactersDetailsPresenter()
        let router                  = CharactersDetailsRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }


    //MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

}
