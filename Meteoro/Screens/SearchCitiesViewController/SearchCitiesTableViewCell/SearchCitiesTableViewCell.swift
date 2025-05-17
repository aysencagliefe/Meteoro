//
//  SearchCitiesTableViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class SearchCitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var searchCityCellView: UIView!
    @IBOutlet weak var searchCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchCityCellView.setupCardView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
