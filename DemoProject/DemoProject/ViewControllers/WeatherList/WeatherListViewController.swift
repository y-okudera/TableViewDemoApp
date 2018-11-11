//
//  WeatherListViewController.swift
//  DemoProject
//
//  Created by Yuki Okudera on 2018/11/12.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

final class WeatherListViewController: UIViewController {
    
    @IBOutlet private weak var weatherListView: UITableView!
    private var weatherList = [Weather]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        weatherListView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set dummy data.
        weatherList = WeatherMock.fetch()
    }
}

// MARK: - UITableViewDataSource
extension WeatherListViewController: UITableViewDataSource {
    
    // MARK: - required
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList[section].timeEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = "WeatherDataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        
        let weather = weatherList[indexPath.section]
        cell.textLabel?.text = weather.displayText(row: indexPath.row)
        
        return cell
    }
    
    // MARK: - optional
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return weatherList[section].location
    }
}
