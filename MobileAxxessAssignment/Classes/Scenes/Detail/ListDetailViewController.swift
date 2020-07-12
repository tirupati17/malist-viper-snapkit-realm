//
//  ListDetailViewController.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 12/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//


import UIKit

final class ListDetailViewController: BaseViewController {

    // MARK: - Public properties -
    var presenter: ListDetailPresenterProtocol!

    // MARK: - Properties -
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return label
    }()

    var dataImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()

    var dataDisplayLabel: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .black
        textView.sizeToFit()
        textView.isEditable = false
        textView.backgroundColor = .clear
        return textView
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK: - Constraints -
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            self.dateLabel.snp.makeConstraints { make in
                make.top.equalTo(self.topbarHeight + 5)
                make.leading.trailing.equalToSuperview().inset(5)
                make.height.equalTo(25)
            }
            
            self.dataImageView.snp.makeConstraints { make in
                make.top.equalTo(self.dateLabel.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }

            self.dataDisplayLabel.snp.makeConstraints { make in
                make.top.equalTo(self.dateLabel.snp.bottom).offset(5)
                make.leading.trailing.equalToSuperview().inset(5)
                make.bottom.equalToSuperview().inset(5)
            }

            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    // MARK: - Methods -
    func setupView() {
        view.backgroundColor = .white

        view.addSubview(self.dataImageView)
        view.addSubview(self.dateLabel)
        view.addSubview(self.dataDisplayLabel)

        view.setNeedsUpdateConstraints()
    }

}

// MARK: - Extensions -

extension ListDetailViewController: ListDetailViewProtocol {
    
    func updateView(_ challenge: ListViewItemProtocol?) {
        if let challenge = challenge {
            self.dateLabel.text = " \(challenge.dateString)"
                        
            switch challenge.dataType {
                case .image:
                    if let url = URL(string: challenge.dataString) {
                        self.dataImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                    }
                default:
                    self.dataDisplayLabel.text = challenge.dataString
            }
        }
    }

}
