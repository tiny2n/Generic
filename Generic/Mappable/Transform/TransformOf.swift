//
//  TransformOf.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

class TransformOf<T, U> /*<Decoded, Encoded>*/: DecodingTransformType {
    typealias Decoded = T
    typealias Encoded = U
    
    private let handler: (Decoded?) -> Encoded?
    
    init(_ handler: @escaping(Decoded?) -> Encoded?) {
        self.handler = handler
    }
    
    func transform(decoded: Decoded?) -> Encoded? {
        return handler(decoded)
    }
}
