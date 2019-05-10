//
//  ViewController.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/9/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import FunctionalTableData

class ViewController: UITableViewController {
    
    var movies = [Movie(title: "Marley and Me", releaseDate: "May 2007", review: "Very Sad Movie ", buyPrice: 1.99), Movie(title: "Star Wars", releaseDate: "June 1984", review: "Very Epic Movie", buyPrice: 1.25), Movie(title: "Interstellar", releaseDate: "April 2016", review: "Its very confusing", buyPrice: 2.25), Movie(title: "Toy Story", releaseDate: "January 2004", review: "Very great story", buyPrice: 2.65)]
    let functionalData = FunctionalTableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        functionalData.tableView = tableView
        self.view.backgroundColor = UIColor.white
        setupNavBar()
        createMovie()

    }
    
    func createMovie() {
//        let movie = Movie(title: "Marley and Me", releaseDate: "06-22-2009", review: "This movie was really sad, I do not like to see movies that are this sad and I really love dogs. Marley was really cute and I think the plot development was really good. Besides how depressing the movie was, I guess I will give it a 8/10", buyPrice: 3.99)
//        self.movie = movie
//        self.title = movie.title
    }


}

extension ViewController: UIConfigurable {
    internal func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

