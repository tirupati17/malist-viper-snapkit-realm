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
            
            self.dataImageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            self.dataDisplayLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(self.topbarHeight)
                make.leading.trailing.bottom.equalToSuperview()
            }

            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    // MARK: - Methods -
    func setupView() {
        view.backgroundColor = .white

        view.addSubview(self.dataImageView)
        view.addSubview(self.dataDisplayLabel)

        view.setNeedsUpdateConstraints()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
    }
        
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }

}

// MARK: - Extensions -

extension ListDetailViewController: ListDetailViewProtocol {
    
    func updateView(_ challenge: ListViewItemProtocol?) {
        if let challenge = challenge {
            self.title = challenge.dateString
                        
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
