//
//  ScreenTwoViewModel.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class ScreenTwoViewModel: NSObject {
    var alamoFireDataSource: AlamoFireDataSource!
       @objc dynamic var Mes: Array<Measurement>!

       init(alamoFireDataSource: AlamoFireDataSource) {
        self.alamoFireDataSource = alamoFireDataSource
       }
       
       func onViewDidLoad() {
           getMeasurements()
       }
       
       func getMeasurements() {
        alamoFireDataSource.getMeasurements{ result in
               switch result {
               case .success(let measurements):
                self.Mes = measurements
               case .failure(_):
                   break
               }
           }
       }
}
