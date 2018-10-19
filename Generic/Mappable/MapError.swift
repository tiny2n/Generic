//
//  MapError.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

struct MapError: Error, CustomStringConvertible {
    var key: String
    var reason: String
    
    init(key: String, reason: String) {
        self.key = key
        self.reason = reason
    }
    
    var description: String {
        return "<<<Map Error>>> [\(key)] \(reason)"
    }
}
