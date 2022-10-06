//
//  FeedCell.swift
//  InstagramFirestoreTutorial
//
//  Created by 조성규 on 2022/09/10.
//

import UIKit

protocol FeedCellDelegate: AnyObject {
    func cell(_ cell: FeedCell, wantsToShowCommentsFor post: Post)
}

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var viewModel: PostViewModel? {
        didSet { configure() }
    }
    
    weak var delegate: FeedCellDelegate?
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapComments), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, leading: leadingAnchor, paddingTop: 12, paddingLeading: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        contentView.addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leadingAnchor: profileImageView.trailingAnchor, paddingLeading: 8)
        
        contentView.addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        contentView.addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, leading: leadingAnchor, paddingTop: -4, paddingLeading: 8)
        
        contentView.addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, leading: leadingAnchor, paddingTop: 8, paddingLeading: 8)
        
        contentView.addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, leading: leadingAnchor, paddingTop: 8, paddingLeading: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func didTapUsername(){
        print("DEBUG: did tap username")
    }
    
    @objc func didTapComments(){
        guard let viewModel = viewModel else {
            print("DEBUG: failed to unwrap viewModel")
            return
        }
        delegate?.cell(self, wantsToShowCommentsFor: viewModel.post)
    }
    
    // MARK: - Helpers
    
    func configureActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        contentView.addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height:  50)
    }
    
    func configure(){
        guard let viewModel = viewModel else { return }
        captionLabel.text = viewModel.caption
        postImageView.sd_setImage(with: viewModel.imageUrl)
        
        profileImageView.sd_setImage(with: viewModel.userProfileImageUrl)
        usernameButton.setTitle(viewModel.username, for: .normal)
        
        likesLabel.text = viewModel.likesLabelText
    }
}
