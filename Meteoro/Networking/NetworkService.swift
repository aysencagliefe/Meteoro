//
//  NetworkService.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
    
  
    
    static let shared = NetworkService()
    
    var deviceToken = ""
    var reachabilityStatus: NetworkReachabilityManager.NetworkReachabilityStatus = .unknown
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        return Session(configuration: configuration, rootQueue: .global())
    }()
    
    private init() { }
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.startListening(onUpdatePerforming: { [weak self] status in
            self?.reachabilityStatus = status
        })
    }
    
    func executeRequest<T: NetworkRequestProtocol, U: Decodable>(
        request: T,
        responseModelType: U.Type,
        isAuthNeeded: Bool = true,
        completion: @escaping NetworkCompletion<U>
    ) {
        
        if !isInternetAvailable() {
            completion(.failure(.reachabilityError))
            return
        }
        
        let url = request.url
        let httpMethod = request.httpMethod
        let httpHeaders: HTTPHeaders = addHeaders(headers: request.headers)
        let requestModel = request.requestModel
        
        execute(
            url: url,
            httpMethod: httpMethod,
            headers: httpHeaders,
            requestModel: requestModel,
            responseModelType: responseModelType,
            isAuthNeeded: isAuthNeeded,
            completion: completion
        )
    }
    
    func executeRequest<T: NetworkRequestProtocol>(
        request: T,
        isAuthNeeded: Bool,
        completion: @escaping NetworkCompletionNoneResponse
    ) {
        if !isInternetAvailable() {
            completion(.failure(.reachabilityError))
            return
        }
        
        let url = request.url
        let httpMethod = request.httpMethod
        let httpHeaders: HTTPHeaders = addHeaders(headers: request.headers)
        let requestModel = request.requestModel
        
        execute(
            url: url,
            httpMethod: httpMethod,
            headers: httpHeaders,
            requestModel: requestModel,
            responseModelType: Never.self,
            isAuthNeeded: isAuthNeeded,
            completion: completion
        )
    }
    
    private func execute<T: Encodable, U: Decodable>(
        url: URLConvertible,
        httpMethod: HTTPMethod,
        headers: HTTPHeaders,
        requestModel: T?,
        responseModelType: U.Type,
        isAuthNeeded: Bool,
        completion: @escaping (Result<U, NetworkError>) -> Void
    ) {
        let startTime = Date().timeIntervalSince1970
        debugPrint(" ")
        debugPrint("----**----")
        debugPrint("URL: \(url)")
        debugPrint(requestModel)
        debugPrint(headers)
        
        session.request(
            url,
            method: httpMethod,
            parameters: requestModel,
            encoder: JSONParameterEncoder.default,
            headers: headers
        ).responseData(queue: .main) { response in
            switch response.result {
            case .success(let data):
                do {
                    debugPrint("api response time: \(Date().timeIntervalSince1970 - startTime) second")
                    debugPrint("Response: " + (String(data: data, encoding: .utf8) ?? "nil"))
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(U.self, from: data)
                    
                    // switch responseModel.status {
                    //case .success:
                    completion(.success(responseModel))
                    /*case .error:
                     completion(.failure(.apiError(
                     title: responseModel.messageTitle,
                     message: responseModel.message,
                     statusCode: responseModel.statusCode)))
                     case .tokenExpire:
                     if isAuthNeeded {
                     // AuthenticationManager.shared.tokenExpired() gibi bir işlem yapabilirsiniz
                     completion(.failure(.authNeeded))
                     } else {
                     completion(.failure(.tokenExpired))
                     }
                     */
                    // }
                    
                } catch {
                    debugPrint(error)
                    completion(.failure(.parseError))
                }
            case .failure(let error):
                debugPrint(error)
                completion(.failure(.badRequestError))
            }
        }
    }
    
    private func isInternetAvailable() -> Bool {
        switch reachabilityStatus {
        case .notReachable:
            return false
        case .unknown:
            return true
        case .reachable(.ethernetOrWiFi):
            return true
        case .reachable(.cellular):
            return true
        }
    }
    
    func addHeaders(headers: [HTTPHeader]? = nil) -> HTTPHeaders {
        var headerParameters = NetworkService.defaultHeaders()
        headers?.forEach { headerParameters.add($0) }
        return headerParameters
    }
    
    class func defaultHeaders() -> HTTPHeaders {
        return HTTPHeaders([
            .contentType("application/json"),
            .init(name: "Origin", value: "https://mgm.gov.tr")

        ])
    }
}
