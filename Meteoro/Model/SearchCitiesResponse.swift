//
//  SearchCitiesResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct SearchCitiesResponse: Codable {
    let alternatifHadiseIstNo: Int?
    let boylam, enlem: Double?
    let gunlukTahminIstNo: Int?
    let il: String?
    let ilPlaka: Int?
    let ilce: String?
    let merkezID, oncelik, saatlikTahminIstNo, sondurumIstNo: Int?
    let yukseklik: Int?
    let aciklama: String?
    let modelID, gps: Int?

    enum CodingKeys: String, CodingKey {
        case alternatifHadiseIstNo, boylam, enlem, gunlukTahminIstNo, il, ilPlaka, ilce
        case merkezID = "merkezId"
        case oncelik, saatlikTahminIstNo, sondurumIstNo, yukseklik, aciklama
        case modelID = "modelId"
        case gps
    }
}
