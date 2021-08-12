//
//  ScreenTwoViewModel.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class ScreenTwoViewModel: NSObject {
    var alamoFireDataSource: AlamoFireDataSource!
    @objc dynamic var measurement: Array<Measurement>!
    var meta:Meta =  Meta(page:1,per_page:10,total:100)

       init(alamoFireDataSource: AlamoFireDataSource) {
        self.alamoFireDataSource = alamoFireDataSource
       }
       
       func onViewDidLoad() {
           getMeasurements()
       }
    func refresh()
    {
        self.meta.page = self.meta.page + 1
        getMeasurements()
    }
       
       func getMeasurements() {
        alamoFireDataSource.getMeasurements(meta:meta){ result in
               switch result {
               case .success(let measurements):
                if (self.measurement == nil)
                {
                    self.measurement = []
                }
                self.measurement.append(contentsOf: measurements.response)
                
        
               case .failure(_):
                   break
               }
           }
       }
}
