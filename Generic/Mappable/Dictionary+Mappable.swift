//
//  Dictionary+Mappable.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    // Normal
    func value<T>(_ key: Key) throws -> T {
        guard let object = self[key] as? T else {
            throw MapError(key: key, reason: "Found unexpected nil value")
        }
        
        return object
    }
    
    // Mappable
    func value<T>(_ key: Key) throws -> T where T: Mappable {
        guard let object = self[key] as? Dictionary else {
            throw MapError(key: key, reason: "Found unexpected nil value")
        }
        
        return try T.init(from: object)
    }
    
    // Enum
    func value<T>(_ key: Key) throws -> T where T: RawRepresentable {
        guard let result: T = try self.value(key, using: EnumerationTransform/*<T>*/()) else {
            throw MapError(key: key, reason: "Found unexpected nil value")
        }
        
        return result
    }
    
    // Array
    func value<T>(_ key: Key) throws -> [T] where T: Mappable {
        guard let object = self[key] as? [Dictionary] else {
            throw MapError(key: key, reason: "Found unexpected nil value")
        }
        
        return try object.map({ try T.init(from: $0) })
    }
    
    func values<T>(_ key: Key) throws -> [T] where T: Mappable {
        guard let object = self[key] as? [Dictionary] else {
            throw MapError(key: key, reason: "Found unexpected nil value")
        }
        
        return object.compactMap({ try? T.init(from: $0) })
    }
    
    // Transform
    func value<Transform>(_ key: Key, using transform: Transform) throws -> Transform.Encoded? where Transform: DecodingTransformType {
        let decoded = self[key] as? Transform.Decoded
        return transform.transform(decoded: decoded)
    }
}
