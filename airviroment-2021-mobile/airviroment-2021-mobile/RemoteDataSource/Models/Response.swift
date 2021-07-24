//
//  Response.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit


class Response:NSObject, Codable{
    
    var meta:Meta?
    var response:Array<Measurement>
    
    enum CodingKeys: String, CodingKey {
       case meta
       case response
    }
}
