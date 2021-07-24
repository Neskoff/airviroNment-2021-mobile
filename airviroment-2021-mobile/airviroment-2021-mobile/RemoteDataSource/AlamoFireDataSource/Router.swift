//
//  Router.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 22.7.21..
//
import Foundation
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://airvironment.live/api")!
    
    enum Measurements: URLRequestConvertible {
        case getMeasurements
        case getLatest
        
        var resource: String {
            switch self {
            case .getMeasurements: return "/measurements"
            case .getLatest:
                return "/measurements/latest"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getMeasurements: return .get
            case .getLatest:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getMeasurements: return resource
            case .getLatest: return resource
            }


        
        }
        
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method

            switch self {
            case .getMeasurements:
                break
            case .getLatest:
                break
            }
            
            return request
        }
    }
}
