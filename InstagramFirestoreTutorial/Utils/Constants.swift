//
//  Constants.swift
//  InstagramFirestoreTutorial
//
//  Created by 조성규 on 2022/09/15.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("Followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("Following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
