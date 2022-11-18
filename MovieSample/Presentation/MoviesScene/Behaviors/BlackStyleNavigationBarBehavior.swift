//
//  BlackStyleNavigationBarBehavior.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import UIKit

struct BlackStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {

    func viewDidLoad(viewController: UIViewController) {

        viewController.navigationController?.navigationBar.barStyle = .black
    }
}
