//
//  TableViewCell.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var PollutionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(measurement:Measurement)
    {
        temperatureLabel.text = String(format:"%.0f",measurement.temperature)
        humidityLabel.text = String(format:"%.0f",measurement.humidity)
        PollutionLabel.text = String(format:"%.0f",measurement.pollution)
    }
    
    
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}
