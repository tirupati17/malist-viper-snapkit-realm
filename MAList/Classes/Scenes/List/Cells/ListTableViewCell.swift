//
//  ListTableViewCell.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import UIKit
import Kingfisher

class ListTableViewCell: BaseTableViewCell {
    
    // MARK: - Properties -
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        return label
    }()

    var dataImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        return imageView
    }()

    var dataDisplayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        label.numberOfLines = 0
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        return label
    }()

    // MARK: - Implementation -

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Constraints -
    override func updateConstraints() {
        if (!didSetupConstraints) {
            self.dateLabel.snp.makeConstraints { make in
                //Inset = Given view is inset from the enclosing view for e.g padding
                //Inset 5px from top
                make.top.equalToSuperview().inset(5)
                
                //Inset 10px from right and left
                make.leading.trailing.equalToSuperview().inset(10)
                
                //As it is date so make it fixed
                make.height.equalTo(25)
            }
            
            self.dataImageView.snp.makeConstraints { make in
                make.top.equalTo(self.dateLabel.snp.bottom).offset(5)
                make.leading.trailing.equalToSuperview().inset(10)
            }
            
            self.dataDisplayLabel.snp.makeConstraints { make in
                make.top.equalTo(self.dataImageView.snp.bottom).offset(5)
                make.leading.trailing.equalToSuperview().inset(10)
                
                //Inset 5px from bottom
                make.bottom.equalToSuperview().inset(5)
            }
            
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    // MARK: - Methods -
    func setupView() {
        contentView.addSubview(self.dateLabel)
        contentView.addSubview(self.dataImageView)
        contentView.addSubview(self.dataDisplayLabel)

        setNeedsUpdateConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.dataDisplayLabel.text = nil
        self.dataImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(_ data: ListViewItemProtocol?) {
        if let data = data {
            self.dateLabel.text = " \(data.dateString)"
                        
            switch data.dataType {
            case .image:
                if let url = URL(string: data.dataString) {
                    self.dataImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                }
            default:
                self.dataDisplayLabel.text = data.dataString
            }
        }
    }

}
