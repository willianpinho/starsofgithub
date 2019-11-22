//
//  RepositoryTableViewCell.swift
//  StarsOfGithub
//
//  Created by Willian Pinho on 21/11/19.
//  Copyright © 2019 Willian Pinho. All rights reserved.
//

import UIKit


class RepositoryTableViewCell: UITableViewCell {
    private enum Constants {
        static let viewHeight: CGFloat = 100.0
        static let stackSpacing: CGFloat = 4.0
        static let shadowRadius: CGFloat = 18.0
        static let shadowOpacity: Float = 0.05
    }
    
    var repository : Repositories.Fetch.ViewModel.Repository? {
        didSet {
            repositoryNameLabel.text = repository?.fullName
            repositoryStarCountLabel.text = repository?.stargazersCount.description
        }
    }
    
    private lazy var repositoryImageImageView : UIImageView = {
        let image = UIImage(named: "repo")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var repositoryNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var repositoryStarImageView : UIImageView = {
        let image = UIImage(named: "star")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var repositoryStarCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.repositoryStarImageView,
            self.repositoryStarCountLabel
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.stackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.repositoryNameLabel,
            self.horizontalStackView
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.stackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var ownerImageImageView : UIImageView = {
        let image = UIImage(named: "person")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var principalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.repositoryImageImageView,
            self.verticalStackView,
            self.ownerImageImageView
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = Constants.stackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.principalStackView)
        contentView.layoutSubviews()
        self.displayConstraints()
    }
    
    
    func displayConstraints() {
        self.displayPrincipalConstraints()
        self.displayVerticalConstraints()
        self.displayHorizontalConstraints()
    }
    
    func displayPrincipalConstraints() {
        NSLayoutConstraint.activate([
            self.principalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.principalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            self.principalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            self.principalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            self.principalStackView.heightAnchor.constraint(equalToConstant: 100),
            self.repositoryImageImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            self.repositoryImageImageView.widthAnchor.constraint(equalTo: self.repositoryImageImageView.heightAnchor, multiplier: 1),
            self.ownerImageImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            self.ownerImageImageView.widthAnchor.constraint(equalTo: self.ownerImageImageView.heightAnchor, multiplier: 1),
        ])
    }
    
    func displayVerticalConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryNameLabel.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor, constant: 5),
            self.repositoryNameLabel.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor, constant: 5)
        ])
    }

    func displayHorizontalConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryStarImageView.widthAnchor.constraint(equalToConstant: 10.0),
            self.repositoryStarImageView.heightAnchor.constraint(equalTo: self.repositoryStarImageView.widthAnchor, multiplier: 1),
            self.repositoryStarCountLabel.leadingAnchor.constraint(equalTo: self.repositoryStarImageView.trailingAnchor, constant: 5),
            self.repositoryStarCountLabel.trailingAnchor.constraint(equalTo: self.horizontalStackView.trailingAnchor, constant: 5)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
