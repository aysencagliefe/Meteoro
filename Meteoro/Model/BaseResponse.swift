//
//  BaseResponse.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 16.05.2025.
//

import Foundation

struct BaseResult: Codable {
    var result: ResultModel?
}

struct ResultModel: Codable {
}

struct BaseResponse<T>: Decodable where T: Decodable {
    var data: T?
    let status: Int
    let error: String?
    let result: Bool?
    let message, path, timestamp: String
}

