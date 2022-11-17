//
//  RepositoryTask.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
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
