//
//  TodayHourlyResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct TodayHourlyWeatherResponse: Codable {
    let baslangicZamani: String
    let istNo: Int
    let merkez: String
    let tahmin: [Tahmin]
}

struct Tahmin: Codable {
    let tarih, hadise: String
    let sicaklik, hissedilenSicaklik, nem, ruzgarYonu: Int
    let ruzgarHizi, maksimumRuzgarHizi: Int
}
