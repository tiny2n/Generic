//
//  AJSONDecoder.swift
//  test
//
//  Created by joongkwan.choi on 05/10/2018.
//  Copyright © 2018 tiny2n. All rights reserved.
//

import Foundation

typealias ADecoder = [String: Any]

protocol ADecodable {
    init(from decoder: ADecoder) throws
}

struct AJSONDecoder {
    static func decode<T>(_ type: T.Type, from decoder: ADecoder) throws -> T where T: ADecodable {
        return try type.init(from: decoder)
    }
}

extension Dictionary where Key == String, Value == Any {
    func decode<T, U>(_ type: T.Type, forKey key: U) throws -> T where U: RawRepresentable {
        guard let rawValue = key.rawValue as? Key, let value = self[rawValue] as? T else {
            throw MapError(key: String(describing: key.rawValue), reason: "Found unexpected nil value")
        }
        
        return value
    }
}

