//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//  Copyright (c) 2021 Michel Mazzoni. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Var's
    var interactor: CharactersBusinessLogic?
    var router: (NSObjectProtocol & CharactersRoutingLogic & CharactersDataPassing)?
    var list = [Characters.CharacterList.ViewModel.CharactersDisplay]()
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CharactersListTableViewCell", bundle: nil), forCellReuseIdentifier: "charactersListCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        getCharacters()
    }
    
    func getCharacters() {
        LoadingView.sharedInstance.showIndicator()
        let request = Characters.CharacterList.Request()
        self.interactor?.getCharacters(request: request)
    }

}
