//
//  SavedCitiesTableViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class SavedCitiesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var savedCitiesView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    @IBOutlet weak var cityimage: UIImageView!
    
    var city : SearchCitiesResponse? {
        didSet {
            if city?.ilce == nil || city?.il == nil {
                    cityLabel.text = city?.il ?? ""
                } else {
                    cityLabel.text = (city?.ilce ?? "") + ", " + (city?.il ?? "")
                }
            cityTemperature.text = String("\(city?.sondurumIstNo)°C")
            //cityimage.image = UIImage(named: city?.)
            }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        savedCitiesView.setupCardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
  
}
