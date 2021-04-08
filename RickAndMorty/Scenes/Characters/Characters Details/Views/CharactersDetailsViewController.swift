//
//  CharactersDetailsViewController.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CharactersDetailsViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelSpecies: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelImage: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    
    //MARK: - Variables
    var interactor: CharactersDetailsBusinessLogic?
    var router: (NSObjectProtocol & CharactersDetailsRoutingLogic & CharactersDetailsDataPassing)?
    
    //MARK: Loading Properties
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [.red, .systemGreen, .systemBlue], lineWidth: 5)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    //MARK: - Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUILoading()
        getCharacterDetails()
        
    }
    
    func setupUILoading() {
        self.view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor
                .constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
    
    func getCharacterDetails(){
        Indicator.sharedInstance.showIndicator()
        let request = CharactersDetails.CharactersDetailsModel.Request(id: 147)
        self.interactor?.getCharacterDetails(request: request)
    }
}
