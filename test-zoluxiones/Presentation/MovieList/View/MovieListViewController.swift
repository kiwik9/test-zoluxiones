//
//  MovieListViewController.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation
import UIKit

class MovieListViewController : UIViewController {
        
    @IBOutlet weak var movieTableList: UITableView!
    private var viewModel = MovieListViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListener()
    }
    
    private func initListener(){
        viewModel.onFetchMoviesListener { (data, message) in
            guard let movies = data else {
                self.showToast(message: message )
                return
            }
            
        }
    }
    
    private func ui(){
        movieTableList.estimatedRowHeight = MoviesListItemCell.height
        movieTableList.rowHeight = UITableView.automaticDimension
        
    }
    
    
}
