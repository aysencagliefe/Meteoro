//
//  NetworkError.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

enum NetworkError: Error {
    case reachabilityError
    case parseError
    case internalServerError
    case badRequestError
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .reachabilityError:
            return "popup_lostinternet_info_text".localized
        default:
            return "Unexpected error."
        }
    }
}
