//
//  BookModel.swift
//  Generic
//
//  Created by joongkwan.choi on 19/10/2018.
//  Copyright © 2018 tiny2n. All rights reserved.
//
//  "type": 0,
//  "rank": 1,
//  "title": "원피스 90",
//  "price": 5000,
//  "published": 1538319.600,
//  "bookmark": true,

import UIKit

// Mappable
struct BookModel: Mappable {
    enum BookType: Int {
        case comic
        case novel
        case essay
        
        var name: String {
            switch self {
            case .comic:
                return "만화"
            case .novel:
                return "소설"
            case .essay:
                return "에세이"
            }
        }
    }
    
    let type: BookType  // Int
    let rank: Int
    let title: String
    let price: Int
    let published: Date? /* Timestamp */
    let bookmark: Bool?
    
    init(from object: [String : Any]) throws {
        type = try object.value("type")//, using: EnumerationTransform/*<EnumType>*/())
        rank = try object.value("rank")
        title = try object.value("title")
        price = try object.value("price")
        published = try object.value("published", using: MillisecondTransform())
        bookmark = try? object.value("bookmark")

//        published = try object.value("dateValue", using: TransformOf<Double, Date>({ (value /*: Double */) -> Date? in
//            if let value = value {
//                return Date(timeIntervalSince1970: TimeInterval(value))
//            }
//
//            return nil
//        }))
    }
}

extension BookModel: CustomStringConvertible {
    var description: String {
        return """
        \n\n===== Structure
        type = \(type)
        rank = \(rank)
        title = \(title)
        price = \(price)
        published = \(String(describing: published))
        bookmark = \(String(describing: bookmark))
        """
    }
}
