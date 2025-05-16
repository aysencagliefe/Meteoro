//
//  NetworkRequestProtocol.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation
import Alamofire

protocol NetworkRequestProtocol {
    associatedtype Element: Encodable
    
    var url: URLConvertible { get }
    var httpMethod: HTTPMethod { get }
    var requestModel: Element? { get }
    var headers: [HTTPHeader]? { get }
}
