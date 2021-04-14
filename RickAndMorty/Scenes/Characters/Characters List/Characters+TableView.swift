//
//  Characters+TableView.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 13/04/21.
//

import UIKit

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath { return 300}
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersListCell", for: indexPath) as! CharactersListTableViewCell
        let item = list[indexPath.row]
        cell.setupView(cellItem: item)
        cell.animateCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
