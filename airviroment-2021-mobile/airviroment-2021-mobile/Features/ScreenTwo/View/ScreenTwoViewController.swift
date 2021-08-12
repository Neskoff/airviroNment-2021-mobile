//
//  ScreenTwoViewController.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class ScreenTwoViewController: UIViewController {
    @IBOutlet weak var measurementTable: UITableView!
    private let viewModel:ScreenTwoViewModel = ScreenTwoViewModel(alamoFireDataSource: AlamoFireDataSource())
    private var nameObserver: NSKeyValueObservation!
    override func viewDidLoad() {
        measurementTable.register(UINib(nibName: TableViewCell.reusableIdentifier(), bundle:nil), forCellReuseIdentifier: TableViewCell.reusableIdentifier())
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()
   

    }
    private func observeLiveData() {
        nameObserver = viewModel.observe(\.measurement, options: .new) { _, Mes  in
                self.measurementTable.dataSource = self
                self.measurementTable.rowHeight = UITableView.automaticDimension
            self.measurementTable.reloadData()
        }
    }
    


            
            
}
extension ScreenTwoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.measurement.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableIdentifier(), for: indexPath) as! TableViewCell
        if let Mes = viewModel.measurement {
            cell.configure(measurement: Mes[indexPath.row])
        }
        
        if  indexPath.row + 1 == viewModel.measurement.count
        {
            viewModel.refresh()
        }

            
        
        return cell
    }
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = .clear
    }
   
    
}



    
    


