//
//  NowWeatherResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct NowWeatherResponseElement: Codable {
    let gorus: Int
    let hadiseKodu: String
    let istNo, kapalilik, karYukseklik, nem: Int
    let rasatMetar, rasatSinoptik, rasatTaf: String
    let ruzgarHiz, aktuelBasinc, denizeIndirgenmisBasinc, denizSicaklik: Double
    let ruzgarYon: Int
    let sicaklik: Double
    let veriZamani: String
    let yagis00Now, yagis10Dk, yagis12Saat, yagis1Saat: Double
    let yagis24Saat, yagis6Saat: Double
    let denizVeriZamani: String
}
 
