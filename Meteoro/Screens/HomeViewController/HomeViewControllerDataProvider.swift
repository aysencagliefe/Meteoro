//
//  HomeViewControllerDataProvider.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

class HomeViewControllerDataProvider: HomeViewControllerProviderProtocol {
    
   
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func nowWeather(merkezid: String?, completion: @escaping NetworkCompletion<[NowWeatherResponseElement]>) {
    
        let url = "https://servis.mgm.gov.tr/web/sondurumlar"
        
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = [
            URLQueryItem(name: "merkezid", value: merkezid)
        ]
        guard let urlString = urlComponents.url?.absoluteString else { return }
        
        let request = NetworkUrlRequest(
            url: urlString,
            httpMethod: .get)
        networkService.executeRequest(
            request: request,
            responseModelType: [NowWeatherResponseElement].self,
            completion: completion)
    
    }
    
    func todayHourlyWeather(istno: String?, completion: @escaping NetworkCompletion<[TodayHourlyWeatherResponse]>) {
    
        
        let url = "https://servis.mgm.gov.tr/web/tahminler/saatlik"
        
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = [
            URLQueryItem(name: "istno", value: istno)
        ]
        guard let urlString = urlComponents.url?.absoluteString else { return }
        
        let request = NetworkUrlRequest(
            url: urlString,
            httpMethod: .get)
        networkService.executeRequest(
            request: request,
            responseModelType: [TodayHourlyWeatherResponse].self,
            completion: completion)
    }
    
    func fiveDaysWeather(istno: String?, completion: @escaping NetworkCompletion<[FiveDaysWeatherResponse]>) {
        
        let url = "https://servis.mgm.gov.tr/web/tahminler/gunluk"
        
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = [
            URLQueryItem(name: "istno", value: istno)
        ]
        guard let urlString = urlComponents.url?.absoluteString else { return }
        
        let request = NetworkUrlRequest(
            url: urlString,
            httpMethod: .get)
        networkService.executeRequest(
            request: request,
            responseModelType: [FiveDaysWeatherResponse].self,
            completion: completion)
    }
    
    
  
    
    
}
