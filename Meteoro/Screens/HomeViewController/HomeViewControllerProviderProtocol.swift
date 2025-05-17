//
//  HomeViewControllerProviderProtocol.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

protocol HomeViewControllerProviderProtocol {
    
    func nowWeather(
        merkezid: String?,
        completion: @escaping NetworkCompletion<[NowWeatherResponseElement]>
    )
    
    func todayHourlyWeather(
        istno: String?,
        completion: @escaping NetworkCompletion<[TodayHourlyWeatherResponse]>
    )
    
    func fiveDaysWeather (
        istno: String?,
    completion: @escaping NetworkCompletion<[FiveDaysWeatherResponse]>
    )
    
    
    
    
    
}
