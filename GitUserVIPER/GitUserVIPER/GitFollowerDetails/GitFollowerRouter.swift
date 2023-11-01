//
//  GitFollowerRouter.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation

import UIKit

class GitFollowerDetailRouter: PresenterToRouterFollowerDetailProtocol {
    static func createModule(with follower: FollowerDetail) -> UIViewController? {
        // This all should come from a Factory >> DI:
        
        if let viewController = UIStoryboard.load(from: .main,
                                                  identifier:Constants.StoryboardsIds.GitFollowerDetailScreen) as? GitFollowerViewController {
            
            let presenter: ViewToPresenterFollowerDetailProtocol & InteractorToPresenterFollowerDetailProtocol = GitFollowerPresenter()
            
            viewController.presenter = presenter
            viewController.presenter?.router = GitFollowerDetailRouter()
            viewController.presenter?.view = viewController
            viewController.presenter?.interactor = GitFollowerInteractor()
            viewController.presenter?.interactor?.followerDetail = follower
            viewController.presenter?.interactor?.presenter = presenter
            
            return viewController
        }
        return nil
    }
}
