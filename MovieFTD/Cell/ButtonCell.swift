//
//  ButtonCell.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/10/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit
import FunctionalTableData

typealias ButtonCell = HostCell<UIButton, ButtonState, LayoutMarginsTableItemLayout>

struct ButtonState: Equatable {
    var title: String
    var action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public static func updateView(_ view: UIButton, state: ButtonState?) {
        guard let state = state else {
            view.setTitle(nil, for: .normal)
            view.removeTarget(nil, action: nil, for: .allEvents)
            return
        }
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.numberOfLines = 0
        view.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        view.contentHorizontalAlignment = .center
        view.setTitle(state.title, for: .normal)
    }
    
    static func ==(lhs: ButtonState, rhs: ButtonState) -> Bool {
        return lhs.title == rhs.title
    }
    

}
