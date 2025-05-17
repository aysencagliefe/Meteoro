//
//  SavedCitiesViewController.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//
import UIKit

class SavedCitiesViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, SearchCitiesViewControllerDelegate  {
  
    var savedCities = UserDefaults.standard.savedCities
    weak var delegate: SelectedCityViewControllerDelegate?
    
 
    @IBOutlet weak var savedCitiesLAbel: UILabel!
    @IBOutlet weak var savedCityListTableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        savedCityListTableView.delegate = self
        savedCityListTableView.dataSource = self
        savedCityListTableView.register(UINib(nibName: "SavedCitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "savedCityCell")
    }

    @IBAction func searchCitiesButton(_ sender: UIButton) {
        let selectCenterVC = SearchCitiesViewController(nibName: "SearchCitiesViewController", bundle: nil)
            selectCenterVC.delegate = self
            self.present(selectCenterVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return savedCities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCityCell", for: indexPath) as? SavedCitiesTableViewCell
        cell?.city = savedCities?[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedCities?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.savedCities = savedCities
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
    
 
    func didSelectCity(_ city: SearchCitiesResponse) {
        savedCities?.append(city)
        savedCityListTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let city = savedCities?[indexPath.row] else { return }
        UserDefaults.standard.selectedCity = city
        dismiss(animated: true)
        delegate?.transferringSelectedCity(city)
    }
    
}

protocol SelectedCityViewControllerDelegate: AnyObject {
    func transferringSelectedCity(_ city: SearchCitiesResponse)
}
