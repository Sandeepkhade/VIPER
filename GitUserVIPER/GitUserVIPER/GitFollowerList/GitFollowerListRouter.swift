//
//  GitFollowerListRouter.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import UIKit

class GitFollowerListRouter: PresenterToRouterFollowerListProtocol {
    
    // factory pattern used to create Module
    static func createModule() -> UINavigationController? {
        
        if let viewController = UIStoryboard.load(from: .main, identifier:Constants.StoryboardsIds.GitFollowerListScreen) as? GitFollowerListViewController {
            
            let navigationController = UINavigationController(rootViewController: viewController)
            
            let presenter: ViewToPresenterFollowerListProtocol & InteractorToPresenterFollowerListProtocol = GitFollowerListPresenter()
            
            viewController.presenter = presenter
            viewController.presenter?.router = GitFollowerListRouter()
            viewController.presenter?.view = viewController
            viewController.presenter?.interactor = GitFollowerListInteractor()
            viewController.presenter?.interactor?.presenter = presenter
            
            return navigationController
        }
        return nil
    }
    
    func pushToFollowerDetail(on view: PresenterToViewFollowerListProtocol?,
                           with Follower: FollowerDetail) {
        if let followerDetailViewController = GitFollowerDetailRouter.createModule(with: Follower){
            
            let viewController = view as! GitFollowerListViewController
            viewController.navigationController?
                .pushViewController(followerDetailViewController,
                                    animated: true)
        }
    }
    
}

extension UIStoryboard {
    
    enum Storyboard: String {
        case main

        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryBoard = UIStoryboard.storyboard(storyboard)
        return uiStoryBoard.instantiateViewController(withIdentifier: identifier)
    }
}
