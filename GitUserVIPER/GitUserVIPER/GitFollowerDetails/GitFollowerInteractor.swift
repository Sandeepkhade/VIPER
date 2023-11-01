//
//  GitFollowerInteractor.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation
import UIKit

class GitFollowerInteractor: PresenterToInteractorFollowerDetailProtocol {
    var followerDetail: FollowerDetail?
    
        var presenter: InteractorToPresenterFollowerDetailProtocol?
    
    func getFollowerData() {
        
        presenter?.getImageFromURLSuccess(followerDetail: followerDetail!)
    }
}
