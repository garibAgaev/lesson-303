//
//  CollectionViewController.swift
//  lesson 303
//
//  Created by Garib Agaev on 01.09.2023.
//

import UIKit

protocol SearchResultTableViewControllerDelegate {
    func addLocation(_ lacation: Location)
    func getColor() -> UIColor?
}

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    let searchController = UISearchController(searchResultsController: SearchResultTableViewController())
    var cityesAndairports: [Location] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemMint
        navigationItem.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        let searchResultTVC = searchController.searchResultsController as? SearchResultTableViewController
        searchResultTVC?.delagate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = searchResultTVC
        
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    //MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityesAndairports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as? CollectionViewCell else {
            let cell = CollectionViewCell()
            cell.setupCell()
            return cell
        }
        cell.setupCell()
        let q = "\(cityesAndairports[indexPath.item].lat),\(cityesAndairports[indexPath.item].lon)"
        NetworkManager.shared.dfs(.currentWeather, q: q, days: nil) { (current: RealtimeAPI) -> Void in
            cell.labelCounty.text = current.location.country
            let regex = /(?:0?[0-9]|1[0-9]|2[0-3]):(?:0?[0-9]|[1-5][0-9])$/
            let reg = current.location.localtime?.firstMatch(of: regex)
            cell.labelHour.text = reg?.description
            cell.labelStatus.text = current.current.condition.text
            cell.tempLabel.text = "\(current.current.tempC)\u{00B0}"
        }
        
        return cell
    }

}

extension CollectionViewController: SearchResultTableViewControllerDelegate {
    func addLocation(_ location: Location) {
        if cityesAndairports.contains(location) { return }
        cityesAndairports.append(location)
    }
    func getColor() -> UIColor? {
        collectionView.backgroundColor
    }
}
