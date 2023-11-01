//
//  GitFollowerViewController.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import UIKit
import Foundation

class GitFollowerViewController: UIViewController {
    
    @IBOutlet weak var mUserNameLbl: UILabel!
    @IBOutlet weak var mGitUserImage: UIImageView!
    @IBOutlet weak var mGitUserBio: UILabel!
    
    var presenter: (ViewToPresenterFollowerDetailProtocol & InteractorToPresenterFollowerDetailProtocol)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
        //presenter to call viewDidLoad:
        presenter?.viewDidLoad()
    }
    
    func setUpUI() {
        self.title = "Follower Details"
    }
}

extension GitFollowerViewController: PresenterToViewFollowerDetailProtocol {
    
    func onGetImageFromURLSuccess() {
        presenter?.populateDataIn(userBio: mGitUserBio, userPicture: mGitUserImage,
                                  userName: mUserNameLbl)
    }
    
    func onGetImageFromURLFailure(error: String) {
        // show alert to user with error msg
    }
}

