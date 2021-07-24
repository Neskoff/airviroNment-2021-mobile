//
//  RemoteDataSource.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//

import UIKit

protocol RemoteDataSource {
    func getLatest(result: @escaping ((Result<Measurement, Error>) -> Void))
    func getMeasurements(result: @escaping ((Result<Array<Measurement>, Error>) -> Void))
}
