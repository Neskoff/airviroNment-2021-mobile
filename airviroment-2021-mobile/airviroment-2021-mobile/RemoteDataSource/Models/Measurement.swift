//
//  Measurement.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit


class Measurement: NSObject, Codable{
    
    var id:Int
    var temperature:Double
    var humidity:Double
    var pollution:Double
    var created:Date
    
    init(id:Int, temperature:Double, humidity:Double, pollution:Double, created:Date) {
        self.id = id
        self.temperature = temperature
        self.humidity = humidity
        self.pollution = pollution
        self.created = created
    }
    enum CodingKeys: String, CodingKey {
        case id
        case temperature
        case humidity
        case pollution
        case created
    }
}
