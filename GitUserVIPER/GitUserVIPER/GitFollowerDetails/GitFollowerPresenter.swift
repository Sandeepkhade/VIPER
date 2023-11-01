//
//  GitFollowerPresenter.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation
import UIKit

// Presentor is responsible to get data from interactor and to present on view
class GitFollowerPresenter: ViewToPresenterFollowerDetailProtocol {
    
    var followerDetail: FollowerDetail?
    var imgFollower: UIImage?
    
    var view: PresenterToViewFollowerDetailProtocol?
    
    var interactor: PresenterToInteractorFollowerDetailProtocol?
    
    var router: PresenterToRouterFollowerDetailProtocol?
    
    func viewDidLoad() {
        interactor?.getFollowerData()
    }
    
    func populateDataIn(userBio: UILabel, userPicture: UIImageView,
                        userName: UILabel) {
        userPicture.downloaded(from: followerDetail?.avatarUrl ?? "")
        userName.text = followerDetail?.name
        userBio.text = followerDetail?.userBio
    }
}

extension GitFollowerPresenter: InteractorToPresenterFollowerDetailProtocol {
    func getImageFromURLSuccess(followerDetail:FollowerDetail) {

        self.followerDetail = followerDetail
        view?.onGetImageFromURLSuccess()
    }
    
    func getImageFromURLFailure(error: String) {
        // Display Alter as required
        print(error)
        view?.onGetImageFromURLFailure(error: error)
    }
}
