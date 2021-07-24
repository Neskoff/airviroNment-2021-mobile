//
//  ScreenOneViewModel.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

class ScreenOneViewModel: NSObject {
    var alamoFireDataSource: AlamoFireDataSource!
       @objc dynamic var latestMes: Measurement!

    var timer:Timer?;
       init(alamoFireDataSource: AlamoFireDataSource) {
        self.alamoFireDataSource = alamoFireDataSource
       }
       
       func onViewDidLoad() {
           getLatest()
        self.timer = Timer.scheduledTimer(timeInterval: 600.0, target: self, selector: #selector(getLatest), userInfo: nil, repeats: true)
       }
       
    @objc func getLatest() {
        alamoFireDataSource.getLatest{ result in
               switch result {
               case .success(let latest):
                self.latestMes = latest
               case .failure(_):
                   break
               }
           }
       }
}
