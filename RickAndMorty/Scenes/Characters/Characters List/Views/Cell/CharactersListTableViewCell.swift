//
//  CharactersListTableViewCell.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 13/04/21.
//

import UIKit

class CharactersListTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelSpecies: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelOrigin: UILabel!
    @IBOutlet weak var labelFirstEpisodeSeen: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(cellItem: Characters.CharacterList.ViewModel.CharactersDisplay) {
        imageStatus.backgroundColor = cellItem.status == "Alive" ? UIColor.systemGreen : UIColor.systemRed
        imageCharacter.loadImage(withUrl: cellItem.image)
        labelName.text = cellItem.name.isEmpty ? "" : "Name: \(cellItem.name)"
        labelStatus.text = cellItem.status.isEmpty ? "" : "Status: \(cellItem.status)"
        labelStatus.tintColor = cellItem.status == "Alive" ? UIColor.systemGreen : UIColor.systemRed
        labelSpecies.text = cellItem.species.isEmpty ? "" : "Species: \(cellItem.species)"
        labelType.text = cellItem.type.isEmpty ? "" : "Type: \(cellItem.type)"
        labelGender.text = cellItem.gender.isEmpty ? "" : "Gender: \(cellItem.gender)"
        labelOrigin.text = cellItem.origin.isEmpty ? "" : "Origin: \(cellItem.origin)"
        labelFirstEpisodeSeen.text = cellItem.firstEpisodeSeen.isEmpty ? "" : "First episode seen: \(cellItem.firstEpisodeSeen)"
    }
    
    func animateCell(){
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 7, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
    
}
