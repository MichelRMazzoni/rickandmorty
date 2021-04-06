//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//

import UIKit

extension UIImageView {
    func loadImage(withUrl url: String) {
        let imageUrlString = url
        guard let imageUrl:URL = URL(string: imageUrlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
