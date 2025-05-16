//
//  String+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

extension String {
    var localized: String {
        get {
            NSLocalizedString(self, comment: "")
        }
    }
}
