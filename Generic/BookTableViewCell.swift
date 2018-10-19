//
//  BookTableViewCell.swift
//  Generic
//
//  Created by joongkwan.choi on 19/10/2018.
//  Copyright © 2018 tiny2n. All rights reserved.
//

import UIKit

final class BookTableViewCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        return formatter
    }()
    
    func configure(_ model: BookModel) {
        titleLabel.text = "\(model.rank). \(model.title)"
        subtitleLabel.text = "\(model.type.name) | \(model.price)"
        
        if let isBookmark = model.bookmark {
            titleLabel.textColor = isBookmark ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        else {
            titleLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        if let isPublished = model.published {
            dateLabel.text = formatter.string(from: isPublished)
        }
        else {
            dateLabel.text = "unknown"
        }
    }

}
