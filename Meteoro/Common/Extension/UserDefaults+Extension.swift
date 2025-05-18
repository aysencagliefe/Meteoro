//
//  UserDefaults+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
       static  let savedCitiesKey = "savedCitiesKey"
        static let selectedCityKey = "selectedCityKey"
        
    }
    
    var savedCities: [SearchCitiesResponse]? {
        get {
            if let data = data(forKey: Keys.savedCitiesKey) {
                let decoder = JSONDecoder()
                do {
                    let saveCity = try decoder.decode([SearchCitiesResponse].self, from: data)
                    return saveCity
                } catch {
                    print("Kayıt yüklerken hata oluştu: \(error)")
                }
            }
            return [Constants.init().defaultCity]
        }
        set {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if let newValue {
                    do {
                        let encoder = JSONEncoder()
                        let data = try encoder.encode(newValue)
                        self.set(data, forKey: Keys.savedCitiesKey)
                    } catch {
                        print("Şehir kaydederken hata oluştu: \(error)")
                    }
                } else {
                    self.removeObject(forKey: Keys.savedCitiesKey)
                }
                self.synchronize()
            }
        }
    }
    
    
    var selectedCity: SearchCitiesResponse? {
        get {
            if let data = data(forKey: Keys.selectedCityKey) {
                let decoder = JSONDecoder()
                do {
                    let selectCity = try decoder.decode(SearchCitiesResponse.self, from: data)
                    return selectCity
                } catch {
                    print("Seçili Şehir yüklenirken hata oluştu: \(error)")
                }
            }
            return Constants.init().defaultCity
        }
        set {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if let newValue {
                    do {
                        let encoder = JSONEncoder()
                        let data = try encoder.encode(newValue)
                        self.set(data, forKey: Keys.selectedCityKey)
                    } catch {
                        print("Seçili şehir yüklenirken hata oluştu: \(error)")
                    }
                } else {
                    self.removeObject(forKey: Keys.selectedCityKey)
                }
                self.synchronize()
            }
        }
    }
    
    
   
    
       
}
 
    
 
