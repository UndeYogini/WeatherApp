//
//  AddViewController.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddViewController: UIViewController {

    //Properties:
    
    @IBOutlet weak var cityTextField: UITextField!
    var delegate: AddWeatherDelegate?
    private var addWeatherVM = AddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveCity(_ sender: Any) {
        if let cityText = cityTextField.text {
            addWeatherVM.AddWeather(city: cityText) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
