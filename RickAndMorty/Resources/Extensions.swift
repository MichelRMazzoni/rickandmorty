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

extension UIView {
    
    func requiredAnimation() {
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(3)
            self.alpha = 1
        }, completion: nil)
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
}
