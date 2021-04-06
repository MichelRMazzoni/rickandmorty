//
//  CharactersRouter.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

@objc protocol CharactersRoutingLogic {

}

protocol CharactersDataPassing {
    var dataStore: CharactersDataStore? { get }
}

class CharactersRouter: NSObject, CharactersRoutingLogic, CharactersDataPassing {

    // Var's
    weak var viewController: CharactersViewController?
    var dataStore: CharactersDataStore?

}
