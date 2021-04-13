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
    @IBOutlet weak var labelSpecies: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelOrigin: UILabel!
    
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
        labelName.text = cellItem.name
        labelSpecies.text = cellItem.species
        labelType.text = cellItem.type
        labelGender.text = cellItem.gender
        labelOrigin.text = cellItem.origin
    }
    
}
