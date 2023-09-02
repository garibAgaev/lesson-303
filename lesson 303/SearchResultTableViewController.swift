//
//  SearchResultTableViewController.swift
//  lesson 303
//
//  Created by Garib Agaev on 01.09.2023.
//

import UIKit

class SearchResultTableViewController: UITableViewController {
    
    var delagate: SearchResultTableViewControllerDelegate!
    
    private var locations: [Location] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.backgroundColor = delagate.getColor()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        locations.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .clear
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(locations[indexPath.row].name), \(locations[indexPath.row].country)"
        cell.contentConfiguration = configuration
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delagate.addLocation(locations[indexPath.row])
        dismiss(animated: true)
    }
}

extension SearchResultTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            print("Ошибка обработки текст в \(UISearchController.self)")
            return
        }
        NetworkManager.shared.dfs(.searchOrAutocomplete, q: text, days: nil) { [weak self] (locations: [Location]) -> Void in
            self?.locations = locations
        }
    }
}
