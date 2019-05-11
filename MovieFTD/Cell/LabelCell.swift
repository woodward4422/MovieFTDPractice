//
//  LabelCell.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/9/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import FunctionalTableData
import UIKit

typealias LabelCell = HostCell<UILabel,LabelState,LayoutMarginsTableItemLayout>

struct LabelState: Equatable {
    let text: String
    let font: UIFont
    let isMultiline: Bool
    
    init(text: String, font: UIFont = UIFont.systemFont(ofSize: 17), isMultiline: Bool = false) {
        self.text = text
        self.font = font
        self.isMultiline = isMultiline
    }
    
    public static func updateView(_ view: UILabel, state: LabelState?) {
        guard let state = state else{
            view.text = nil
            view.font = UIFont.systemFont(ofSize: 17)
            view.numberOfLines = 1
            view.lineBreakMode = .byTruncatingTail
            return
        }
        
        view.text = state.text
        view.font = state.font
        
        if state.isMultiline {
            view.numberOfLines = 0
            view.lineBreakMode = .byWordWrapping
        } else {
            view.numberOfLines = 1
            view.lineBreakMode = .byTruncatingTail
        }
    }
    
    static func ==(lhs: LabelState, rhs: LabelState) -> Bool {
        return lhs.text == rhs.text && lhs.font == rhs.font && lhs.isMultiline == rhs.isMultiline
    }
}
