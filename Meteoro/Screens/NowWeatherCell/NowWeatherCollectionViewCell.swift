//
//  NowWeatherCollectionViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class NowWeatherCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: NowWeatherCollectionViewCellDelegate?
    
    @IBOutlet weak var nowWeatherView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var visualSkyImageView: UIImageView!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var pressureAirLabel: UILabel!
    
    var selectedCity: SearchCitiesResponse? {
        didSet {
            if let selectedCity {
                cityNameLabel.text = selectedCity.il
            }
        }
    }
    
    var weatherStatus: WeatherStatus?
    
    var nowWeatherResponse : NowWeatherResponseElement? {
        didSet {
            if let nowWeatherResponse {
                weatherStatus = WeatherStatus(rawValue: nowWeatherResponse.hadiseKodu)
                cityNameLabel.text = "\(nowWeatherResponse.istNo)"
                dateLabel.text = dateFormatter(dateString: nowWeatherResponse.veriZamani)
                visualSkyImageView.image = weatherStatus?.icon
                temperatureLabel.text = String("\(nowWeatherResponse.sicaklik )°C")
                humidityLabel.text =    String("Nem: %\(nowWeatherResponse.nem)")
                windyLabel.text =       String("Rüzgar: \(nowWeatherResponse.ruzgarHiz.toFormattedString(withDecimalPlaces: 2)) km/sa")
                pressureAirLabel.text = String("Basınç: \(nowWeatherResponse.aktuelBasinc) hPa")
            }
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nowWeatherView.setupCardView()
        
        accountImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(accountImageTapped))
        accountImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func accountImageTapped() {
        delegate?.didTapAccountImage()
    }
    
    
    
    @IBAction func savedCitiesButton(_ sender: Any) {
        delegate?.didTapSavedButton(in: self)
    }
    
    
    
    
    func dateFormatter(dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = inputFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM HH:mm"
            dateFormatter.locale = Locale(identifier: "tr_TR")
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
}
   


protocol NowWeatherCollectionViewCellDelegate: AnyObject {
    func didTapSavedButton(in cell: NowWeatherCollectionViewCell)
    func didTapAccountImage()
    
}
