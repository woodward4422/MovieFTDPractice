//
//  Movie.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/9/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    var title: String
    var releaseDate: String
    var review: String
    var buyPrice: Double
    var isFavorite: Bool
    
    init(title: String, releaseDate: String, review: String, buyPrice: Double, isFavorite: Bool) {
        self.title = title
        self.releaseDate = releaseDate
        self.review = review
        self.buyPrice = buyPrice
        self.isFavorite = isFavorite
    }
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.releaseDate == rhs.releaseDate && lhs.review == rhs.review && lhs.buyPrice == rhs.buyPrice && lhs.isFavorite == rhs.isFavorite
    }
}
