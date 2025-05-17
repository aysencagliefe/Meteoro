//
//  HourlyCollectionViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    var hourlyGuess: Tahmin? {
        didSet {
            guard let hourlyGuess else { return }
            timeHourlyLabel.text = dateFormatter(dateString: hourlyGuess.tarih)
            skyHourlyimage.image = UIImage(named: hourlyGuess.hadise)
            temperatureHourlyLabel.text = String("\(hourlyGuess.sicaklik)°C")
        }
    }

    @IBOutlet weak var hourlyView: UIView!
    @IBOutlet weak var timeHourlyLabel: UILabel!
    @IBOutlet weak var skyHourlyimage: UIImageView!
    @IBOutlet weak var temperatureHourlyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hourlyView.setupCardView()
       
       
    }
  
    
    func dateFormatter(dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let date = inputFormatter.date(from: dateString) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
    
    
    
    


}

