//
//  ProfileHeaderViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by 조성규 on 2022/09/15.
//

import UIKit

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonText: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var numberOfFollowers: NSAttributedString {
        guard let stats = user.stats else { return attributedStatText(value: 0, label: "followers") }
        return attributedStatText(value: stats.followers, label: "followers")
    }
    
    var numberOfFollowing: NSAttributedString {
        guard let stats = user.stats else { return attributedStatText(value: 0, label: "following") }
        return attributedStatText(value: stats.following, label: "following")
    }
    
    var numberOfPosts: NSAttributedString {
        guard let stats = user.stats else { return attributedStatText(value: 0, label: "posts") }
        return attributedStatText(value: stats.posts, label: "posts")
    }
    
    init(user: User) {
        self.user = user
    }
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\(label)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return attributedText
    }
}
