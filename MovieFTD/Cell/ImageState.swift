//
//  ImageState.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/10/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import FunctionalTableData

typealias ImageCell = HostCell<UIImageView,ImageState,LayoutMarginsTableItemLayout>

struct ImageState: Equatable {
    let image: UIImage
    let tintColor: UIColor
    
    init(image: UIImage, tintColor: UIColor = .gray) {
        self.image = image
        self.tintColor = tintColor
    }
    public static func updateView(_ view: UIImageView, state: ImageState?) {
        guard let state = state else {
            view.tintColor = .gray
            view.image = nil
            return
        }
        view.tintColor = state.tintColor
        view.image = state.image
    }
    static func ==(lhs: ImageState, rhs: ImageState) -> Bool {
        return lhs.image == rhs.image && lhs.tintColor == rhs.tintColor
    }
}
