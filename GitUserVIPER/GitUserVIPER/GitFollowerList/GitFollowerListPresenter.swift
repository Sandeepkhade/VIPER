//
//  GitFollowerListPresenter.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import UIKit

class GitFollowerListPresenter: ViewToPresenterFollowerListProtocol {
     
    var followers = [Followers]()
    
    var view: PresenterToViewFollowerListProtocol?
    var interactor: PresenterToInteractorFollowerListProtocol?
    var router: PresenterToRouterFollowerListProtocol?
    
    func viewDidLoad() {

        // Presenter is asking to Interactor to load new data:
        interactor?.fetchFollowerList()
    }
    
    func numberOfRowsInSection() -> Int {
        return followers.count
    }
    
    func setCell(tableView: UITableView,
                 forRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GitFollowerTableViewCell {
                cell.setData(model: followers[indexPath.row])
                return cell
        }
        return UITableViewCell()
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.getFollowerDetailAt(follower: followers[index])
    }
}

extension GitFollowerListPresenter: InteractorToPresenterFollowerListProtocol {
    
    func fetchFollowerListSuccess(follower: [Followers]) {
        self.followers = follower
        view?.onFetchFollowerListSuccess()
    }
    
    func fetchFollowerListFailure(error: String) {
        view?.onFetchFollowerListFailure(error: "Fetch Follower error with error code-\(error)")
    }
        
    func getFollowerDetailSuccess(_ detail: FollowerDetail) {

        router?.pushToFollowerDetail(on: view, with: detail)
    }
    
    func getFollowerDetailFailure() {
        print("Follower detail failure")
    }
}
