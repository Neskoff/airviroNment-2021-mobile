//
//  ScreenOneViewController.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class ScreenOneViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pollutionLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    private let viewModel:ScreenOneViewModel = ScreenOneViewModel(alamoFireDataSource: AlamoFireDataSource())
    private var nameObserver: NSKeyValueObservation!
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()

    }
    
    @IBAction func onButtonClicked(_ sender: Any) {
        navigationController!.show((ScreenTwoViewController()), sender: nil)
    }
    deinit {
        viewModel.timer?.invalidate()
        viewModel.timer = nil
    }
    private func observeLiveData() {
        nameObserver = viewModel.observe(\.latestMes, options: .new) { _, latestMes  in
            if let latestMes = latestMes.newValue{
                let tempsign = "°"
                let tempstring = String(format:"%.1f",latestMes!.temperature)
                self.temperatureLabel.text = "\(tempstring)\(tempsign)"
                self.humidityLabel.text = String(format:"%.1f",latestMes!.humidity)
                self.pollutionLabel.text = String(latestMes!.pollution)
                let dateformater = DateFormatter()
                dateformater.dateFormat = "YY/MM/dd HH:mm:ss"
                let newdate:String = dateformater.string(from: latestMes!.created)
                self.lastUpdatedLabel.text = "Updated At: \(newdate)"
            }
            
            
        }
    }




}
