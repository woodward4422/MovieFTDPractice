//
//  ViewController.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/9/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import FunctionalTableData

class MoviesViewController: UITableViewController {
    
    var movies = [Movie(title: "Marley and Me", releaseDate: "May 2007", review: "Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie  Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie Very Sad Movie", buyPrice: 1.99, isFavorite: false), Movie(title: "Star Wars", releaseDate: "June 1984", review: "Very Epic Movie", buyPrice: 1.25, isFavorite: false), Movie(title: "Interstellar", releaseDate: "April 2016", review: "Its very confusing", buyPrice: 2.25, isFavorite: false), Movie(title: "Toy Story", releaseDate: "January 2004", review: "Very great story", buyPrice: 2.65, isFavorite: false)]
    let functionalData = FunctionalTableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        functionalData.tableView = tableView
        self.view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Movies"
        setupNavBar()
        render()
    }
    
    private func render(){
        functionalData.renderAndDiff([movieSection()])
    }
    
    private func present(movie: Movie) {
        let movieVC = MovieViewController()
        movieVC.movie = movie
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
    private func toggleFavorite(movie: Movie) {
        guard let index = movies.lastIndex(where: { $0 == movie }) else {return}
        var copy = movie
        if copy.isFavorite {
            copy.isFavorite = false
        } else {
            copy.isFavorite = true
        }
        movies[index] = copy
        
        render()
    }
    
    private func movieSection() -> TableSection {
        typealias MovieCell = CombinedCell<UILabel, LabelState, UIImageView, ImageState, LayoutMarginsTableItemLayout>
        let cells: [CellConfigType] = movies.map { movie in
            let rowAction = UITableViewRowAction(style: .normal, title: movie.isFavorite ? "Unfave" : "Fave", handler: { [weak self] _, _ in
                self?.toggleFavorite(movie: movie)
            })
            let action = CellActions(selectionAction: { [weak self] _ in
                self?.present(movie:movie)
                return .selected
                }, rowActions: [rowAction])
           // return LabelCell(key: "key-\(movie.title)", style: nil, actions: action, state: LabelState(text: movie.title), cellUpdater: LabelState.updateView)
            let labelState = LabelState(text: movie.title)
            let imageState = ImageState(image: UIImage(named: "heart")!, tintColor:  movie.isFavorite ? .red : UIColor.gray)
            let combinedState = CombinedState(state1: labelState, state2: imageState)
            
            let combinedCell = MovieCell(key: "key-\(movie)", style: nil, actions: action, state: combinedState, cellUpdater: { (view, state) in
                view.view2.setContentHuggingPriority(.required, for: .horizontal)
                
                LabelState.updateView(view.view1, state: state?.state1)
                ImageState.updateView(view.view2, state: state?.state2)
            })
            
            return combinedCell
        }
        return TableSection(key: "movies", rows: cells, header: nil, footer: nil, style: nil, didMoveRow: nil)
    }



}

extension MoviesViewController: UIConfigurable {
    internal func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

