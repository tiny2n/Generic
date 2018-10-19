//
//  DecodingTransformType.swift
//  Generics
//
//  Created by joongkwan.Choi on 2018. 6. 7..
//  Copyright © 2018년 tiny2n Corp. All rights reserved.
//

import Foundation

public protocol DecodingTransformType {
    associatedtype Decoded
    associatedtype Encoded
    
    func transform(decoded: Decoded?) -> Encoded?
}
