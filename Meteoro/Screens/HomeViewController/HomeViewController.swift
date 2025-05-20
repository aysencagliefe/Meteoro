//
//  HomeViewController.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HomeViewControllerDelegate, NowWeatherCollectionViewCellDelegate, SelectedCityViewControllerDelegate {
  
    let selectedCity = UserDefaults.standard.selectedCity 

    var viewModel: HomeViewControllerViewModel = {
        HomeViewControllerViewModel(
            dataProvider: HomeViewControllerDataProvider())
    }()
    
    var nowWeatherResponse: NowWeatherResponseElement?
    var todayHourlyResponse: TodayHourlyWeatherResponse?
    var fiveDaysResponse: FiveDaysWeatherResponse?
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPullToRefresh()
        viewModel.delegate = self
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "NowWeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NowWeatherCell")
        homeCollectionView.register(UINib(nibName: "TodayHourlyWeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TodayHourlyWeatherCell")
        homeCollectionView.register(UINib(nibName: "FiveDaysWeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FiveDaysWeatherCell")
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.nowWeather(merkezid: String(describing: selectedCity?.merkezID ?? 0))
        viewModel.todayHourlyWeather(istno: String(describing: selectedCity?.saatlikTahminIstNo ?? 0))
        viewModel.fiveDaysWeather(istno: String(describing: selectedCity?.gunlukTahminIstNo ?? 0))
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowWeatherCell", for: indexPath) as! NowWeatherCollectionViewCell
            cell.nowWeatherResponse = nowWeatherResponse
            cell.selectedCity = UserDefaults.standard.selectedCity
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayHourlyWeatherCell", for: indexPath) as! TodayHourlyWeatherCollectionViewCell
            cell.todayHourlyResponse = todayHourlyResponse
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiveDaysWeatherCell", for: indexPath) as! FiveDaysWeatherCollectionViewCell
            cell.fiveDaysResponse = fiveDaysResponse
            return cell
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch indexPath.row {
            case 0:
                return CGSize(width: collectionView.frame.width, height: 350)
            case 1:
                return CGSize(width: collectionView.frame.width, height: 150)
            case 2:
                return CGSize(width: collectionView.frame.width, height: 420)
            default:
                return CGSize.zero
            }
        }
    
    private func setupCollectionView() {
            homeCollectionView.delegate = self
            homeCollectionView.dataSource = self
       }

    private func setupPullToRefresh() {
           refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            homeCollectionView.refreshControl = refreshControl
       }

    @objc private func refreshData() {
       let selectedCity = UserDefaults.standard.selectedCity
       viewModel.nowWeather(merkezid: String(describing: selectedCity?.merkezID ?? 0))
       viewModel.todayHourlyWeather(istno: String(describing: selectedCity?.saatlikTahminIstNo ?? 0))
       viewModel.fiveDaysWeather(istno: String(describing: selectedCity?.gunlukTahminIstNo ?? 0))
    }
        
    func nowReceiveData(_data: NowWeatherResponseElement?) {
        self.refreshControl.endRefreshing()
        nowWeatherResponse = _data
        setBackgroundColorWithNowWeather(nowWeatherResponse: _data)
        homeCollectionView.reloadData()
    }
    
    func setBackgroundColorWithNowWeather(nowWeatherResponse: NowWeatherResponseElement?) {
        let weatherStatus = WeatherStatus(rawValue: nowWeatherResponse?.hadiseKodu ?? "")
        view.applyGradient(
            startColor: weatherStatus?.gradientColors[0],
            endColor: weatherStatus?.gradientColors[1]
        )
    }
    
    func todayHourlyReceiveData(_data: TodayHourlyWeatherResponse?) {
        self.refreshControl.endRefreshing()
        todayHourlyResponse = _data
        homeCollectionView.reloadData()
        
    }
    func fiveDaysReceiveData(_data: FiveDaysWeatherResponse?) {
        self.refreshControl.endRefreshing()
        fiveDaysResponse = _data
        homeCollectionView.reloadData()
    }
    
    func didTapSavedButton(in cell: NowWeatherCollectionViewCell) {
        let savedCityVC = SavedCitiesViewController(nibName: "SavedCitiesViewController", bundle: nil)
        savedCityVC.delegate = self
        present(savedCityVC, animated: true, completion: nil)
        
    }
    
    func didTapAccountImage() {
        let signInVC = SignInAccountViewController(nibName: "SignInAccountViewController", bundle: nil)
        present(signInVC, animated: true, completion: nil)
    }
    
    
    
    func transferringSelectedCity(_ city: SearchCitiesResponse) {
        viewModel.nowWeather(merkezid: String(describing: city.merkezID ?? 0))
        viewModel.todayHourlyWeather(istno: String(describing: city.saatlikTahminIstNo ?? 0))
        viewModel.fiveDaysWeather(istno: String(describing: city.gunlukTahminIstNo ?? 0))
    }
    
    
}



