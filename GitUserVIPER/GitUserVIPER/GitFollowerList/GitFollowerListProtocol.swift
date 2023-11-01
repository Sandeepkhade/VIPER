//
//  GitFollowerListProtocol.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation
import UIKit

// MARK: - View -> Presenter
protocol ViewToPresenterFollowerListProtocol {
    
    var view: PresenterToViewFollowerListProtocol? { get set }
    var interactor: PresenterToInteractorFollowerListProtocol? { get set }
    var router: PresenterToRouterFollowerListProtocol? { get set }
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func setCell(tableView: UITableView,
                 forRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(index: Int)
    
}
// MARK: - Presenter -> View
protocol PresenterToViewFollowerListProtocol {
    func onFetchFollowerListSuccess()
    func onFetchFollowerListFailure(error: String)
}
// MARK: - Presenter -> Interactor
protocol PresenterToInteractorFollowerListProtocol {
    var presenter: InteractorToPresenterFollowerListProtocol? { get set }
    var follower: [Followers]? { get set }
    
    func fetchFollowerList()
    func getFollowerDetailAt(follower: Followers)
    
}
// MARK: - Interactor -> Presenter
protocol InteractorToPresenterFollowerListProtocol {
    
    func fetchFollowerListSuccess(follower: [Followers])
    func fetchFollowerListFailure(error: String)
    
    // Follower Details:
    func getFollowerDetailSuccess(_ detail: FollowerDetail)
    func getFollowerDetailFailure()
    
}
// MARK: - Presenter -> Router

protocol PresenterToRouterFollowerListProtocol {
    
    static func createModule() -> UINavigationController?
    func pushToFollowerDetail(on view: PresenterToViewFollowerListProtocol?,
                           with follower: FollowerDetail)
}
