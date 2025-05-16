//
//  NetworkServiceProtocol.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

typealias NetworkCompletion<T: Decodable> = (Result<T, NetworkError>) -> Void
typealias NetworkCompletionNoneResponse = (Result<Never, NetworkError>) -> Void

protocol NetworkServiceProtocol: AnyObject {
    func executeRequest<T: NetworkRequestProtocol, U: Decodable>(
        request: T,
        responseModelType: U.Type,
        isAuthNeeded: Bool,
        completion: @escaping NetworkCompletion<U>
    )
    
    func executeRequest<T: NetworkRequestProtocol>(
        request: T,
        isAuthNeeded: Bool,
        completion: @escaping NetworkCompletionNoneResponse
    )
}

extension NetworkServiceProtocol {
    func executeRequest<T: NetworkRequestProtocol, U: Decodable>(
        request: T,
        responseModelType: U.Type,
        completion: @escaping NetworkCompletion<U>
    ) {
        executeRequest(
            request: request,
            responseModelType: responseModelType,
            isAuthNeeded: true,
            completion: completion
        )
    }
    
    func executeRequest<T: NetworkRequestProtocol>(
        request: T,
        completion: @escaping NetworkCompletionNoneResponse
    ) {
        executeRequest(
            request: request,
            isAuthNeeded: true,
            completion: completion
        )
    }
}
