//
//  StarTableViewCell.swift
//  Stars.app4
//
//  Created by Osha Washington on 12/5/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let star = star else { return }
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) light years away."
    }
}
