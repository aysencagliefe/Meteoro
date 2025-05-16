//
//  WarningResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct WarningResponse: Codable {
    let seriNo, baslangic, baslik, hadiseCinsi: String
    let ihbarTipi: Int
}
