//
//  SearchCitiesViewModel.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//
import Foundation

class SearchCitiesViewModel {
    
    var delegate: SearchCitiesDelegate?
    
    private let dataProvider: SearchCitiesProviderProtocol
    
    init(dataProvider: SearchCitiesDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func searchCity(il: String) {
        dataProvider.searchCity(il: il) { result in
                do {
                try self.delegate?.searchCityReceiveData(_data: result.get())
            } catch {
                print("error searchCity")
            }
        }
    }
    
    
}
protocol SearchCitiesDelegate: AnyObject {
    func searchCityReceiveData(_data: [SearchCitiesResponse?])
    
}
