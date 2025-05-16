//
//  UIView+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation
import UIKit

extension UIView {
    func setupCardView() {
        
        // Köşeleri yuvarlat
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false

        /*
        // Gölge ekle
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
         */
        
        // Kenar çizgisi ekle
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
