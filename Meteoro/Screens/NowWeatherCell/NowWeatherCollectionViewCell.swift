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
    @IBOutlet weak var visualSkyLabel: UIImageView!
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
    
    
    var nowWeatherResponse : NowWeatherResponseElement? {
        didSet {
            if let nowWeatherResponse {
                cityNameLabel.text = "\(nowWeatherResponse.istNo)"
                dateLabel.text = dateFormatter(dateString: nowWeatherResponse.veriZamani)
                visualSkyLabel.image = UIImage(named: nowWeatherResponse.hadiseKodu)
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
    }
    
    @IBAction func savedCitiesButton(_ sender: Any) {
        delegate?.didTapSavedButton(in: self)
    }
    
    @IBAction func warningsButton(_ sender: Any) {
        delegate?.didTapWarningButton(in: self)
    }
    
    
    

    func dateFormatter(dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" // Gelen API formatı
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
    func didTapWarningButton(in cell: NowWeatherCollectionViewCell)
}
