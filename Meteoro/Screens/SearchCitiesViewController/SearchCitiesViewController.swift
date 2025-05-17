//
//  SearchCitiesViewController.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class SearchCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, SearchCitiesDelegate {
  
    var viewModel: SearchCitiesViewModel = {
        SearchCitiesViewModel(
            dataProvider: SearchCitiesDataProvider())
    }()
    var searchCitiesList: [SearchCitiesResponse?] = []
    var tapGesture: UITapGestureRecognizer!
    var searchTimer: Timer?
    weak var delegate: SearchCitiesViewControllerDelegate?


        
    @IBOutlet weak var citySearchBar: UISearchBar!
    @IBOutlet weak var selectCityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchBar.delegate = self
        selectCityTableView.delegate = self
        selectCityTableView.dataSource = self
        viewModel.delegate = self
        selectCityTableView.register(UINib(nibName: "SearchCitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "CityCell")
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.isEnabled = false
        view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func closedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchCitiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? SearchCitiesTableViewCell else {
               return UITableViewCell()
           }

           let city = searchCitiesList[indexPath.row]
           if city?.ilce == nil  {
               cell.searchCityLabel?.text = city?.il ?? ""
           } else {
               cell.searchCityLabel?.text = (city?.ilce ?? "") + ", " + (city?.il ?? "")
           }

           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveCity(city: searchCitiesList[indexPath.row])
    }
    
    func saveCity(city: SearchCitiesResponse?) {
        if let city = city {
            var savedCities = UserDefaults.standard.savedCities ?? []
            savedCities.append(city)
            UserDefaults.standard.savedCities = savedCities
            delegate?.didSelectCity(city)
            dismiss(animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
           searchCitiesList = []
           self.selectCityTableView.reloadData()
        } 
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            guard let searchText = searchBar.text, !searchText.isEmpty else { return }
            self?.viewModel.searchCity(il: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
    }
   
    func searchCityReceiveData(_data: [SearchCitiesResponse?]) {
        searchCitiesList = _data
        selectCityTableView.reloadData()
    }
    
    @objc func keyboardWillShow() {
        tapGesture.isEnabled = true
    }
    
    @objc func keyboardWillHide() {
        tapGesture.isEnabled = false
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

protocol SearchCitiesViewControllerDelegate: AnyObject {
    func didSelectCity(_ city: SearchCitiesResponse)
}




