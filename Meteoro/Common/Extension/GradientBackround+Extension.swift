//
//  GradientBackround+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

extension UIView {
    
    func applyGradient (
        startColor: UIColor?,
        endColor: UIColor?
    ) {
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor?.cgColor, endColor?.cgColor]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

