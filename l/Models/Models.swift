//
//  Models.swift
//  l
//
//  Created by user217575 on 4/29/22.
//

import Foundation

enum Gender{
    case male, female, other
}

struct User{
    let username: String
    let bio: String
    let name : (first: String, last: String)
    let birthDate: Date
    let profilePhoto: URL
    let gender: Gender
    let counts: UserCount
    let joinedDate: Date
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType: String{
    
    case photo="Photo"
    case video="Video"
}


/// A user's post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // video or  url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
    let owner: User
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
