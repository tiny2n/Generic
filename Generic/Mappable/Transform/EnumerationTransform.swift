//
//  EnumerationTransform.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

class EnumerationTransform<T: RawRepresentable>: DecodingTransformType {
    typealias Decoded = T.RawValue
    typealias Encoded = T
    
    init() { }
    
    func transform(decoded: T.RawValue?) -> T? {
        if let decoded = decoded {
            return T(rawValue: decoded)
        }
        
        return nil
    }
}
