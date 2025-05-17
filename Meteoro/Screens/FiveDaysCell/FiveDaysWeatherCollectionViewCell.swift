//
//  FiveDaysWeatherCollectionViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class FiveDaysWeatherCollectionViewCell: UICollectionViewCell {
    
    var fiveDaysResponse: FiveDaysWeatherResponse? {
        didSet {
            guard let fiveDaysResponse else { return }
            dayLabel1.text = getDayOfWeek(from: fiveDaysResponse.tarihGun1)
            dayLabel2.text = getDayOfWeek(from: fiveDaysResponse.tarihGun2)
            dayLabel3.text = getDayOfWeek(from: fiveDaysResponse.tarihGun3)
            dayLabel4.text = getDayOfWeek(from: fiveDaysResponse.tarihGun4)
            dayLabel5.text = getDayOfWeek(from: fiveDaysResponse.tarihGun5)
            dateLabel1.text = dateFormatter(dateString:fiveDaysResponse.tarihGun1)
            dateLabel2.text = dateFormatter(dateString:fiveDaysResponse.tarihGun2)
            dateLabel3.text = dateFormatter(dateString:fiveDaysResponse.tarihGun3)
            dateLabel4.text = dateFormatter(dateString:fiveDaysResponse.tarihGun4)
            dateLabel5.text = dateFormatter(dateString:fiveDaysResponse.tarihGun5)
            lowestTemperature1.text = String("Düşük \(fiveDaysResponse.enDusukGun1 )°C - ")
            lowestTemperature2.text = String("Düşük \(fiveDaysResponse.enDusukGun2 )°C - ")
            lowestTemperature3.text = String("Düşük \(fiveDaysResponse.enDusukGun3 )°C - ")
            lowestTemperature4.text = String("Düşük \(fiveDaysResponse.enDusukGun4 )°C - ")
            lowestTemperature5.text = String("Düşük \(fiveDaysResponse.enDusukGun5 )°C - ")
            highestTemperature1.text = String("Yüksek \(fiveDaysResponse.enYuksekGun1 )°C")
            highestTemperature2.text = String("Yüksek \(fiveDaysResponse.enYuksekGun2 )°C")
            highestTemperature3.text = String("Yüksek \(fiveDaysResponse.enYuksekGun3 )°C")
            highestTemperature4.text = String("Yüksek \(fiveDaysResponse.enYuksekGun4 )°C")
            highestTemperature5.text = String("Yüksek \(fiveDaysResponse.enYuksekGun5 )°C")
            imageIcon1.image = UIImage(named: fiveDaysResponse.hadiseGun1)
            imageIcon2.image = UIImage(named: fiveDaysResponse.hadiseGun2)
            imageIcon3.image = UIImage(named: fiveDaysResponse.hadiseGun3)
            imageIcon4.image = UIImage(named: fiveDaysResponse.hadiseGun4)
            imageIcon5.image = UIImage(named: fiveDaysResponse.hadiseGun5)
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fiveDayView1: UIView!
    @IBOutlet weak var fiveDayView2: UIView!
    @IBOutlet weak var fiveDayView3: UIView!
    @IBOutlet weak var fiveDayView4: UIView!
    @IBOutlet weak var fiveDayView5: UIView!
    @IBOutlet weak var dayLabel1: UILabel!
    @IBOutlet weak var dayLabel2: UILabel!
    @IBOutlet weak var dayLabel3: UILabel!
    @IBOutlet weak var dayLabel4: UILabel!
    @IBOutlet weak var dayLabel5: UILabel!
    @IBOutlet weak var dateLabel1: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateLabel3: UILabel!
    @IBOutlet weak var dateLabel4: UILabel!
    @IBOutlet weak var dateLabel5: UILabel!
    @IBOutlet weak var lowestTemperature1: UILabel!
    @IBOutlet weak var lowestTemperature2: UILabel!
    @IBOutlet weak var lowestTemperature3: UILabel!
    @IBOutlet weak var lowestTemperature4: UILabel!
    @IBOutlet weak var lowestTemperature5: UILabel!
    @IBOutlet weak var highestTemperature1: UILabel!
    @IBOutlet weak var highestTemperature2: UILabel!
    @IBOutlet weak var highestTemperature3: UILabel!
    @IBOutlet weak var highestTemperature4: UILabel!
    @IBOutlet weak var highestTemperature5: UILabel!
    @IBOutlet weak var imageIcon1: UIImageView!
    @IBOutlet weak var imageIcon2: UIImageView!
    @IBOutlet weak var imageIcon3: UIImageView!
    @IBOutlet weak var imageIcon4: UIImageView!
    @IBOutlet weak var imageIcon5: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fiveDayView1.setupCardView()
        fiveDayView2.setupCardView()
        fiveDayView3.setupCardView()
        fiveDayView4.setupCardView()
        fiveDayView5.setupCardView()
         
    }
    
    func dateFormatter(dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = inputFormatter.date(from: dateString) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
    
    func getDayOfWeek(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = dateFormatter.date(from: dateString) {
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEEE"
            dayFormatter.locale = Locale(identifier: "tr_TR")
            return dayFormatter.string(from: date)
        }
        return ""
    }
    



}
