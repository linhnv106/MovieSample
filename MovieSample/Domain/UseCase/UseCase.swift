//
//  UseCase.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation
public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
