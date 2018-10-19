//
//  Mappable.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

protocol Mappable {
    init(from object: [String: Any]) throws
}

extension Mappable {
    static func decode(from object: [String: Any]) throws -> Self {
        return try self.init(from: object)
    }
}
