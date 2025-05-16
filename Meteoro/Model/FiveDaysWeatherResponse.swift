//
//  FiveDaysResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct FiveDaysWeatherResponse: Codable {
    let enDusukGun1, enDusukGun2, enDusukGun3, enDusukGun4, enDusukGun5: Int
    let enDusukNemGun1, enDusukNemGun2, enDusukNemGun3, enDusukNemGun4, enDusukNemGun5: Int
    let enYuksekGun1, enYuksekGun2, enYuksekGun3, enYuksekGun4, enYuksekGun5: Int
    let enYuksekNemGun1, enYuksekNemGun2, enYuksekNemGun3, enYuksekNemGun4, enYuksekNemGun5: Int
    let hadiseGun1, hadiseGun2, hadiseGun3, hadiseGun4, hadiseGun5: String
    let istNo, ruzgarHizGun1, ruzgarHizGun2, ruzgarHizGun3, ruzgarHizGun4, ruzgarHizGun5: Int
    let ruzgarYonGun1, ruzgarYonGun2, ruzgarYonGun3, ruzgarYonGun4, ruzgarYonGun5: Int
    let tarihGun1, tarihGun2, tarihGun3, tarihGun4, tarihGun5: String
}
