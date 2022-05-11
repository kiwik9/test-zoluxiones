//
//  MovieListViewController.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation
import UIKit

class MovieListViewController : UITableViewController {
        
    @IBOutlet weak var movieTableList: UITableView!
    private var viewModel = MovieListViewModel()
    private var movies = [Movie]()
    private var page = 1
    private var totalPage = 1
    private var currentPage : Int8 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListener()
        ui()
    }
    
    private func initListener(){
        viewModel.onFetchMoviesListener { (data, message) in
            guard let moviesResult = data else {
                self.showToast(message: message )
                return
            }
            self.movies = moviesResult
            
        }
    }
    
    private func ui(){
        movieTableList.estimatedRowHeight = MoviesListItemCell.height
        movieTableList.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListItemCell", for: indexPath)
        if let cell = cell as? MoviesListItemCell {
            //if !movies.isEmpty { cell.setupCellWith(movie: movies[indexPath.row]) }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentPage < totalPage && indexPath.row == movies.count - 1 {
            currentPage += 1
            viewModel.fetchMovies(page: currentPage)
        }
    }
    
    
}
