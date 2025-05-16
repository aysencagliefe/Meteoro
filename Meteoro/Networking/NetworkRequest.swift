//
//  NetworkRequest.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation
import Alamofire

struct NetworkRequest<T: Encodable>: NetworkRequestProtocol {
    var url: URLConvertible
    var httpMethod: HTTPMethod
    var requestModel: T?
    var headers: [HTTPHeader]?
    
    init(
        url: String,
        httpMethod: HTTPMethod,
        requestModel: T? = nil,
        headers: [HTTPHeader]? = nil
    ) {
        self.url = url
        self.httpMethod = httpMethod
        self.requestModel = requestModel
        self.headers = headers
    }
}

struct NetworkUrlRequest: NetworkRequestProtocol {
    var url: URLConvertible
    var httpMethod: HTTPMethod
    var requestModel: String? = nil
    var headers: [HTTPHeader]?
    
    init(
        url: String,
        httpMethod: HTTPMethod,
        headers: [HTTPHeader]? = nil
    ) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
    }
}
