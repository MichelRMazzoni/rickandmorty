//
//  CharactersDetailsRouter.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol CharactersDetailsRoutingLogic {

}

protocol CharactersDetailsDataPassing {
    var dataStore: CharactersDetailsDataStore? { get }
}

class CharactersDetailsRouter: NSObject, CharactersDetailsRoutingLogic, CharactersDetailsDataPassing {

    //MARK: - Variables
    weak var viewController: CharactersDetailsViewController?
    var dataStore: CharactersDetailsDataStore?

}
