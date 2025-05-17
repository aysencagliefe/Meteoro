//
//  TodayHourlyWeatherCollectionViewCell.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class TodayHourlyWeatherCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var todayHourlyCollectionView: UICollectionView!
    
    var todayHourlyResponse : TodayHourlyWeatherResponse? {
        didSet {
            if let todayHourlyResponse {
                todayHourlyCollectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        todayHourlyCollectionView.delegate = self
        todayHourlyCollectionView.dataSource = self
        todayHourlyCollectionView.register(UINib(nibName: "HourlyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HourlyCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayHourlyResponse?.tahmin.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        cell.hourlyGuess = todayHourlyResponse?.tahmin[indexPath.row]
        return cell
        
    }
   
    

   
}

