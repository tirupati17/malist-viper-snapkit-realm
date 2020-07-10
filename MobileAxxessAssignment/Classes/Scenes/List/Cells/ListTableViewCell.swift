//
//  ListTableViewCell.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import UIKit
import Kingfisher

class ListTableViewCell: BaseTableViewCell {
    
    // MARK: - Properties -
    var dateLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 12)
        return lable
    }()

    var dataImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var dataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    // MARK: - Implementation -

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Constraints -
    override func updateConstraints() {
        if (!didSetupConstraints) {
            
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    // MARK: - Methods -

    func setupView() {
        //
        setNeedsUpdateConstraints()
    }

    func configureCell(_ data: ListViewItemProtocol?) {
        if let data = data {
            self.dateLabel.text = data.dateString
            switch data.type {
                case .kImage:
                    if let url = URL(string: data.data) {
                        self.dataImageView.kf.setImage(with: url)
                    }
                default:
                    self.dataLabel.text = data.data
            }
        }
    }

}
