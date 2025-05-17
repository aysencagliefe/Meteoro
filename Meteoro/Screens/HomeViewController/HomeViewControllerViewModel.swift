//
//  HomeViewControllerViewModel.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

class HomeViewControllerViewModel {
    
    var delegate: HomeViewControllerDelegate?
    
    private let dataProvider: HomeViewControllerProviderProtocol
    
    init(dataProvider: HomeViewControllerProviderProtocol) {
        self.dataProvider = dataProvider
        UserDefaults.standard 
    }
    
    func nowWeather(merkezid: String?) {
        dataProvider.nowWeather(merkezid: merkezid) { result in
            do {
                try self.delegate?.nowReceiveData(_data: result.get().first)
            } catch {
                print("error nowWeather")

            }
        }
        
    }
    
    func todayHourlyWeather(istno: String?) {
        dataProvider.todayHourlyWeather(istno: istno) { result in
            do {
                try self.delegate?.todayHourlyReceiveData(_data: result.get().first)
            } catch {
                print("error todayHourly")
            }
        }
    }
    
    func fiveDaysWeather(istno: String) {
        dataProvider.fiveDaysWeather(istno: istno)  { result in
            do {
                try self.delegate?.fiveDaysReceiveData(_data: result.get().first)
            } catch {
                print("error fiveDays")
            }
        }
    }
    
   
    
    
}

protocol HomeViewControllerDelegate: AnyObject {
    func nowReceiveData(_data: NowWeatherResponseElement?)
    func todayHourlyReceiveData(_data: TodayHourlyWeatherResponse?)
    func fiveDaysReceiveData(_data: FiveDaysWeatherResponse?)
}
