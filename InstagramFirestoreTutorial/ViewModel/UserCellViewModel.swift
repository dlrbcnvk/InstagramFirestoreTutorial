//
//  UserCellViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by 조성규 on 2022/09/16.
//

import Foundation

struct UserCellViewModel {
    
    private let user : User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var username: String {
        return user.username
    }
    
    var fullname: String {
        return user.fullname
    }
    
    init(user: User) {
        self.user = user
    }
}
