//
//  MillisecondTransform.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

class MillisecondTransform: DecodingTransformType {
    typealias Decoded = TimeInterval
    typealias Encoded = Date
    
    init() { }
    
    func transform(decoded: TimeInterval?) -> Date? {
        if let decoded = decoded {
            return Date(timeIntervalSince1970: TimeInterval(decoded))
        }
        
        return nil
    }
}
