//
//  WeatherStatus.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//
import Foundation

enum WeatherStatus: String {
    case clear = "A"
    case cloudy = "B"
    case fewCloudy = "AB"
    case partlyCloudy = "PB"
    case mostlyCloudy = "CB"
    case lightRainy = "HY"
    case rainy = "Y"
    case heavyRainy = "KY"
    case occasionalShowers = "MSY"
    case lightShower = "HSY"
    case shower = "SY"
    case heavyShower = "KSY"
    case thunderstormShower = "GSY"
    case heavyThunderstormShower = "KYG"
    case mixedRainAndSnow = "KKY"
    case lightSnowy = "HKY"
    case snowyWeather = "K"
    case heavySnowy = "YKY"
    case hail = "DY"
    case smoke = "DMN"
    case mist = "PUS"
    case fog = "SIS"
    case windy = "R"
    case dustOrSandStorm = "KF"
    case strongSouthWind = "GKR"
    case strongNorthWind = "KKR"
    var description: String {
        switch self {
        case .clear: return "Açık"
        case .fewCloudy: return "Az Bulutlu"
        case .partlyCloudy: return "Parçalı Bulutlu"
        case .mostlyCloudy: return "Çok Bulutlu"
        case .lightRainy: return "Hafif Yağmurlu"
        case .rainy: return "Yağmurlu"
        case .heavyRainy: return "Kuvvetli Yağmurlu"
        case .occasionalShowers: return "Bölgesel Sağanak Yağışlı"
        case .lightShower: return "Hafif Sağanak"
        case .shower: return "Sağanak Yağışlı"
        case .heavyShower: return "Kuvvetli Sağanak Yağışlı"
        case .thunderstormShower: return "Gökgürültülü Sağanak Yağışlı"
        case .heavyThunderstormShower: return "Kuvvetli Gökgürültülü Sağanak"
        case .mixedRainAndSnow: return "Karla Karışık Yağmurlu"
        case .lightSnowy: return "Hafif Kar Yağışlı"
        case .snowyWeather: return "Kar Yağışlı"
        case .heavySnowy: return "Yoğun Kar Yağışlı"
        case .hail: return "Dolu"
        case .smoke: return "Dumanlı"
        case .mist: return "Puslu"
        case .fog: return "Sisli"
        case .windy: return "Rüzgarlı"
        case .dustOrSandStorm: return "Toz veya Kum Fırtınası"
        case .strongSouthWind: return "Güneyli Kuvvetli Rüzgar"
        case .strongNorthWind: return "Kuzeyli Kuvvetli Rüzgar"
        case .cloudy: return "Bulutlu"
        }
    }
    
}
