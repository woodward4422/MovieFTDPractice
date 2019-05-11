//
//  MovieViewController.swift
//  MovieFTD
//
//  Created by Noah Woodward on 5/10/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import UIKit
import FunctionalTableData

class MovieViewController: UITableViewController {
    var movie: Movie!
    var tableData = FunctionalTableData()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData.tableView = tableView
        view.backgroundColor = UIColor.white
        self.title = movie.title
        render()
    }
    
    private func render() {
        tableData.renderAndDiff([getSummarySection(),getPurchaseSection()])
    }
    
    private func getSummarySection() -> TableSection {
        let labelState = LabelState(text: movie.review, font: UIFont.systemFont(ofSize: 22), isMultiline: true)
        let row: [CellConfigType] = [LabelCell(key: "movie-summary", state: labelState) { (view, state) in
            LabelState.updateView(view, state: state)
        }]
        return TableSection(key: "movie-summary-section", rows: row, header: nil, footer: nil, style: nil, didMoveRow: nil)
    }
    
    private func getPurchaseSection() -> TableSection {
        let row: [CellConfigType] = [ButtonCell(key: "key-purch-butt", state: ButtonState(title: "\(movie.buyPrice) Purchase", action: {}), cellUpdater: { (view, state) in
            view.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.2745098039, blue: 0.4980392157, alpha: 1)
            ButtonState.updateView(view, state: state)
        }), ButtonCell(key: "key-share", state: ButtonState(title: "Share", action: {
            print("Share button was pressed!")
        }), cellUpdater: { (view, state) in
            view.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.2745098039, blue: 0.4980392157, alpha: 1)
            ButtonState.updateView(view, state: state)
        })]
        return TableSection(key: "movie-purchase-section", rows: row, header: nil, footer: nil, style: nil, didMoveRow: nil)
    }
    
}
