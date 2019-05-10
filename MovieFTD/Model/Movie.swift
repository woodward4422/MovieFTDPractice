//
//  Movie.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/9/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var releaseDate: String
    var review: String
    var buyPrice: Double
    
    init(title: String, releaseDate: String, review: String, buyPrice: Double) {
        self.title = title
        self.releaseDate = releaseDate
        self.review = review
        self.buyPrice = buyPrice
    }
}
