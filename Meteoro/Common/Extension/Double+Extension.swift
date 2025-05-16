//
//  Double+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

extension Double {
    func toFormattedString(withDecimalPlaces places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}

