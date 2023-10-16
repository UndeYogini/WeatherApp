//
//  CutsomViewCell.swift
//  WeatherApp
//
//  Created by Yogini Unde on 14/10/23.
//

import UIKit

class CutsomViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func Configure(_ vm: WeatherViewModel) {
        self.title.text = vm.city
        self.temp.text = String(format: "%.0f",  vm.temp)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
