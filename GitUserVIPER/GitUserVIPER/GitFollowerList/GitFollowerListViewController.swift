//
//  GitFollowerListViewController.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation
import UIKit

class GitFollowerListViewController: UIViewController {
    
    
    @IBOutlet weak var followesTableView: UITableView!
    
    var presenter: (ViewToPresenterFollowerListProtocol & InteractorToPresenterFollowerListProtocol)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        //presenter to call viewDidLoad:
        presenter?.viewDidLoad()
    }
    
    func setUpUI() {
        
        self.title = "Git Followers - VIPER"

        followesTableView.register(UINib(nibName: "GitFollowerTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.XibIdentifires.homeScreenCell)
        followesTableView.delegate = self
        followesTableView.dataSource = self
        followesTableView.tableFooterView = UIView(frame: .zero)
        followesTableView.backgroundColor = .clear
        followesTableView.separatorColor = UIColor.white
    }
}

extension GitFollowerListViewController: PresenterToViewFollowerListProtocol {
    func onFetchFollowerListSuccess() {
        followesTableView?.reloadData()
    }
    
    func onFetchFollowerListFailure(error: String) {
        print(error)
    }
}

extension GitFollowerListViewController: UITableViewDelegate,
                                    UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView,
                                  forRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}

