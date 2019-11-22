//
//  RepositoryTableViewCell.swift
//  StarsOfGithub
//
//  Created by Willian Pinho on 21/11/19.
//  Copyright © 2019 Willian Pinho. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryTableViewCell: UITableViewCell {
    private enum Constants {
        static let stackSpacing: CGFloat = 4.0
    }
    
    var repository : Repositories.Fetch.ViewModel.Repository? {
        didSet {
            repositoryNameLabel.text = repository?.fullName
            repositoryStarCountLabel.text = repository?.stargazersCount.description
            ownerImageImageView.sd_setImage(with: URL(string: repository?.owner.avatarUrl ?? ""), placeholderImage: UIImage(named: "person")?.withRenderingMode(.alwaysOriginal))
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
        label.numberOfLines = 0
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
        label.numberOfLines = 0
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
        stackView.distribution = .equalCentering
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
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.stackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var ownerImageImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layoutIfNeeded()
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
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.stackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.principalStackView)
        contentView.layoutSubviews()
        contentView.layoutIfNeeded()
        self.displayConstraints()
    }
    
    
    func displayConstraints() {
        NSLayoutConstraint.activate([
            self.principalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            self.principalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            self.principalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            self.principalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
        self.displayRepositoryImageImageViewConstraints()
        self.displayVerticalStackViewContraints()
        self.displayOwnerImageViewContraints()
    }
    
    func displayRepositoryImageImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryImageImageView.leadingAnchor.constraint(equalTo: self.principalStackView.leadingAnchor, constant: 5),
            self.repositoryImageImageView.trailingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor, constant: 20),
            self.repositoryImageImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            self.repositoryImageImageView.widthAnchor.constraint(equalTo: self.repositoryImageImageView.heightAnchor, multiplier: 1)
        ])
    }
    
    func displayVerticalStackViewContraints() {
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.principalStackView.topAnchor, constant: 5),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.repositoryImageImageView.trailingAnchor, constant: 10),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.ownerImageImageView.leadingAnchor, constant: -5),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.principalStackView.bottomAnchor, constant: 5),
        ])
        self.displayNameLabelConstraints()
        self.displayHorizontalConstraints()
    }
    
    func displayOwnerImageViewContraints() {
        NSLayoutConstraint.activate([
            self.ownerImageImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            self.ownerImageImageView.widthAnchor.constraint(equalTo: self.ownerImageImageView.heightAnchor, multiplier: 1)
        ])
    }
    
    func displayNameLabelConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryNameLabel.topAnchor.constraint(equalTo: self.verticalStackView.topAnchor, constant: 20),
            self.repositoryNameLabel.bottomAnchor.constraint(equalTo: self.horizontalStackView.topAnchor, constant: -10),
            self.repositoryNameLabel.leadingAnchor.constraint(equalTo: self.repositoryImageImageView.trailingAnchor, constant: 0),
            self.repositoryNameLabel.trailingAnchor.constraint(equalTo: self.ownerImageImageView.leadingAnchor, constant: 0)
        ])
    }
    
    func displayHorizontalConstraints() {
        self.displayStarImageViewConstraints()
        self.displayStarCountLabelConstraints()
    }
    
    func displayStarImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryStarImageView.leadingAnchor.constraint(equalTo: self.repositoryImageImageView.trailingAnchor, constant: 0),
            self.repositoryStarImageView.trailingAnchor.constraint(equalTo: self.repositoryStarCountLabel.leadingAnchor, constant: -10),
            self.repositoryStarImageView.topAnchor.constraint(equalTo: self.horizontalStackView.topAnchor, constant: 0),
            self.repositoryStarImageView.bottomAnchor.constraint(equalTo: self.horizontalStackView.bottomAnchor, constant: -20),
            self.repositoryStarImageView.widthAnchor.constraint(equalToConstant: 10.0),
            self.repositoryStarImageView.heightAnchor.constraint(equalTo: self.repositoryStarImageView.widthAnchor, multiplier: 1)
        ])
    }
    
    func displayStarCountLabelConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryStarCountLabel.leadingAnchor.constraint(equalTo: self.repositoryStarImageView.trailingAnchor, constant: 0),
            self.repositoryStarCountLabel.trailingAnchor.constraint(equalTo: self.ownerImageImageView.leadingAnchor, constant: 0),
            self.repositoryStarCountLabel.topAnchor.constraint(equalTo: self.horizontalStackView.topAnchor, constant: 0),
            self.repositoryStarCountLabel.bottomAnchor.constraint(equalTo: self.horizontalStackView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
