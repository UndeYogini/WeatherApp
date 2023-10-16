//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

import UIKit

class WeatherListViewController: UITableViewController, AddWeatherDelegate {

    private var listViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView Delegate and DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CutsomViewCell
        
        cell.Configure(listViewModel.ModelAt(indexPath.row))
        
        return cell
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        listViewModel.AddWeatherVieModel(vm)
        self.tableView.reloadData()
    }
    
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddViewController else {
            fatalError("AddWeatherCityController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
}
