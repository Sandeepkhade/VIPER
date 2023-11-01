//
//  GitFollowerProtocols.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import UIKit


// MARK: - View -> Presenter
protocol ViewToPresenterFollowerDetailProtocol {
    var view: PresenterToViewFollowerDetailProtocol? { get set }
    var interactor: PresenterToInteractorFollowerDetailProtocol? { get set }
    var router: PresenterToRouterFollowerDetailProtocol? { get set }
    
    func viewDidLoad()
    func populateDataIn(userBio: UILabel,userPicture: UIImageView, userName: UILabel)
}

// MARK: - Presenter -> View
protocol PresenterToViewFollowerDetailProtocol {
    func onGetImageFromURLSuccess()
    func onGetImageFromURLFailure(error: String)
}

// MARK: - Presenter -> Interactor
protocol PresenterToInteractorFollowerDetailProtocol {
    var followerDetail: FollowerDetail? { get set }
    var presenter: InteractorToPresenterFollowerDetailProtocol? { get set }
    func getFollowerData()
}

// MARK: - Interactor -> Presenter
protocol InteractorToPresenterFollowerDetailProtocol {
    func getImageFromURLSuccess(followerDetail:FollowerDetail)
    func getImageFromURLFailure(error: String)
}

// MARK: - Presenter -> Router
protocol PresenterToRouterFollowerDetailProtocol {
    static func createModule(with Follower: FollowerDetail) -> UIViewController?
}
