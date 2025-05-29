import UIKit

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
    case heavyThunderstormShower = "KGY"
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
    case extremelyHot = "SCK"

    var description: String {
        switch self {
        case .clear: return "Açık"
        case .cloudy: return "Bulutlu"
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
        case .extremelyHot: return "Aşırı Sıcak"
            
        }
    }

    var gradientColors: [UIColor] {
        switch self {
        case .clear:
            return [UIColor(hex: 0xFFFFD740), UIColor(hex: 0xFFFFF59D)]
        case .cloudy:
            return [UIColor(hex: 0xFFCFD8DC), UIColor(hex: 0xFFB0BEC5)]
        case .fewCloudy:
            return [UIColor(hex: 0xFF90CAF9), UIColor(hex: 0xFF64B5F6)]
        case .partlyCloudy:
            return [UIColor(hex: 0xFF64B5F6), UIColor(hex: 0xFF2196F3)]
        case .mostlyCloudy:
            return [UIColor(hex: 0xFF455A64), UIColor(hex: 0xFF263238)]
        case .lightRainy, .lightShower:
            return [UIColor(hex: 0xFF4FC3F7), UIColor(hex: 0xFF29B6F6)]
        case .rainy:
            return [UIColor(hex: 0xFF0288D1), UIColor(hex: 0xFF0277BD)]
        case .heavyRainy, .heavyShower:
            return [UIColor(hex: 0xFF01579B), UIColor(hex: 0xFF003C8F)]
        case .occasionalShowers:
            return [UIColor(hex: 0xFF039BE5), UIColor(hex: 0xFF0288D1)]
        case .shower:
            return [UIColor(hex: 0xFF29B6F6), UIColor(hex: 0xFF0288D1)]
        case .thunderstormShower:
            return [UIColor(hex: 0xFF536DFE), UIColor(hex: 0xFF304FFE)]
        case .heavyThunderstormShower:
            return [UIColor(hex: 0xFF1A237E), UIColor(hex: 0xFF0D1B73)]
        case .mixedRainAndSnow:
            return [UIColor(hex: 0xFF7986CB), UIColor(hex: 0xFF5C6BC0)]
        case .lightSnowy:
            return [UIColor(hex: 0xFF81D4FA), UIColor(hex: 0xFFB3E5FC)]
        case .snowyWeather:
            return [UIColor(hex: 0xFF81D4FA), UIColor(hex: 0xFFE1F5FE)]
        case .heavySnowy:
            return [UIColor(hex: 0xFF0288D1), UIColor(hex: 0xFF0277BD)]
        case .hail:
            return [UIColor(hex: 0xFFC0CA33), UIColor(hex: 0xFFAFB42B)]
        case .fog:
            return [UIColor(hex: 0xFFE0E0E0), UIColor(hex: 0xFFBDBDBD)]
        case .mist:
            return [UIColor(hex: 0xFFB0BEC5), UIColor(hex: 0xFF90A4AE)]
        case .smoke:
            return [UIColor(hex: 0xFFECEFF1), UIColor(hex: 0xFFCFD8DC)]
        case .windy:
            return [UIColor(hex: 0xFFFF5722), UIColor(hex: 0xFFE64A19)]
        case .dustOrSandStorm:
            return [UIColor(hex: 0xFF8D6E63), UIColor(hex: 0xFF795548)]
        case .strongSouthWind:
            return [UIColor(hex: 0xFFF44336), UIColor(hex: 0xFFD32F2F)]
        case .strongNorthWind:
            return [UIColor(hex: 0xFF3F51B5), UIColor(hex: 0xFF303F9F)]
        case .extremelyHot:
            return [UIColor(hex: 0xFF9800), UIColor(hex: 0xE53935)]
        }
    }

    var textColor: UIColor {
        switch self {
        case .mostlyCloudy, .rainy, .heavyRainy, .shower, .heavyShower, .thunderstormShower, .heavyThunderstormShower, .mixedRainAndSnow, .extremelyHot:
            return .white
        default:
            return .black
        }
    }

    var icon: UIImage? {
        switch self {
        case .clear:
            return UIImage(named: "ic_clear")
        case .rainy, .heavyRainy, .heavyShower, .shower, .lightRainy, .occasionalShowers, .thunderstormShower, .heavyThunderstormShower:
            return UIImage(named: "ic_rainy")
        case .cloudy:
            return UIImage(named: "ic_cloud")
        case .fewCloudy, .partlyCloudy:
            return UIImage(named: "ic_partly_cloudy")
        case .mostlyCloudy:
            return UIImage(named: "ic_mostly_Cloudy")
        case .snowyWeather, .lightSnowy:
            return UIImage(named: "ic_snowing")
        case .heavySnowy:
            return UIImage(named: "ic_heavy_snowing")
        case .fog, .mist, .smoke:
            return UIImage(named: "ic_foggy")
        case .windy, .strongNorthWind, .strongSouthWind, .dustOrSandStorm:
            return UIImage(named: "ic_windy")
        case .hail:
            return UIImage(named: "ic_hail")
        case .mixedRainAndSnow:
            return UIImage(named: "ic_mix_rainy_snowy")
        case .extremelyHot:
            return UIImage(named: "ic_thermostat")
        default:
            return UIImage(named: "ic_clear")
        }
    }
}
