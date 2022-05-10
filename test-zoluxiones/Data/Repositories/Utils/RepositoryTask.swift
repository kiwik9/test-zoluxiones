//
//  RepositoryTask.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 9/05/22.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
