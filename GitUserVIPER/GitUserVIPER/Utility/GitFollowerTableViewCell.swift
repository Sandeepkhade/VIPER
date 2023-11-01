//
//  GitFollowerTableViewCell.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import UIKit

final class GitFollowerTableViewCell: UITableViewCell {

    @IBOutlet weak var mAvtarImg: UIImageView!
    @IBOutlet weak var mTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mAvtarImg.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(model: Followers) {
        self.mTitleLbl.text = model.name?.capitalizingFirstLetter()
        self.mAvtarImg.downloaded(from: model.avatarUrl ?? "")
    }
}

