//
//  GitFollowerListInteractor.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation

class GitFollowerListInteractor: PresenterToInteractorFollowerListProtocol {

    
    var presenter: InteractorToPresenterFollowerListProtocol?
    
    var follower: [Followers]?
    var followerDetail: FollowerDetail?

    func fetchFollowerList() {
        NetworkManager.networkManagerShared.fetchFollowerData { (response) in
          
            self.follower = response
            if let followerList = self.follower {

                self.presenter?.fetchFollowerListSuccess(follower: followerList)
            }
        }
    }
    
    func getFollowerDetailAt(follower: Followers) {
        
        NetworkManager.networkManagerShared.fetchUserData(url: follower.userDetails ?? "") { (response) in
            
            self.followerDetail = response
            if let followerData = self.followerDetail {

                self.presenter?.getFollowerDetailSuccess(followerData)
            }
        }
    }
    
}
