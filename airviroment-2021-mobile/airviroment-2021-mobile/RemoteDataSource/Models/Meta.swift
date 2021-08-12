//
//  Meta.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit


class Meta: NSObject, Codable{
    
    var page:Int
    var per_page:Int
    var total:Int
    
    init(page:Int, per_page:Int, total:Int) {
        self.page = page
        self.per_page = per_page
        self.total = total
        
    }
    enum CodingKeys: String, CodingKey {
       case page
       case per_page
       case total
    }
}
