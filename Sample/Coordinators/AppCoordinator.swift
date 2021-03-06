//
//  AppCoordinator.swift
//  Sample
//
//  Created by Emad Ghorbaninia on 09/09/2020.
//  Copyright © 2020 Nuuday. All rights reserved.
//

import UIKit

/// The AppCoordinator. Takes responsibility about coordinating view controllers and driving the flow
class AppCoordinator: BaseCoordinator {

    typealias DependencyProvider = AppCoordinatorDependencyProvider & MoviesSearchCoordinatorDependencyProvider

    private let window: UIWindow
    private let dependencyProvider: DependencyProvider
    private var childCoordinators = [BaseCoordinator]()

    init(window: UIWindow, dependencyProvider: DependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }

    /// Creates all necessary dependencies and starts the flow
    func start() {

        let searchNavigationController = UINavigationController()
        searchNavigationController.navigationBar.tintColor = UIColor.black

        self.window.rootViewController = searchNavigationController

        let searchCoordinator = MoviesSearchCoordinator(rootController: searchNavigationController, dependencyProvider: self.dependencyProvider)
        searchCoordinator.start()

        self.childCoordinators = [searchCoordinator]
    }

}
