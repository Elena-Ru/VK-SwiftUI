//
//  News.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import Foundation
import SwiftUI

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? JSONDecoder().decode(News.self, from: jsonData)

// MARK: - News
struct News: Codable {
    let response: Response?
}

// MARK: - Response
struct Response: Codable {
    let items: [Item]?
    let profiles: [Profile]?
    let groups: [NewsGroup]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }
}

// MARK: - Group
struct NewsGroup: Codable {
    let id: Int?
    var name, screenName: String
    let isClosed: Int?
    let type: GroupType?
    let isAdmin, isMember, isAdvertiser: Int?
    var photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

enum GroupType: String, Codable {
    case group
    case page
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let type: PostTypeEnum?
    let sourceID, date, carouselOffset: Int?
    let shortTextRate: Double?
    let donut: Donut?
    let comments: Comments?
    let markedAsAds: Int?
    let attachments: [ItemAttachment]?
    let id: Int?
    let isFavorite: Bool?
    let likes: Likes?
    let ownerID, postID: Int?
    let postSource: ItemPostSource?
    let postType: PostTypeEnum?
    let reposts: Reposts?
    let text: String?
    let views: Views?
    let copyHistory: [CopyHistory]?
    let canSetCategory, canDoubtCategory: Bool?
    let topicID, edited: Int?

    enum CodingKeys: String, CodingKey {
        case type
        case sourceID = "source_id"
        case date
        case carouselOffset = "carousel_offset"
        case shortTextRate = "short_text_rate"
        case donut, comments
        case markedAsAds = "marked_as_ads"
        case attachments, id
        case isFavorite = "is_favorite"
        case likes
        case ownerID = "owner_id"
        case postID = "post_id"
        case postSource = "post_source"
        case postType = "post_type"
        case reposts, text, views
        case copyHistory = "copy_history"
        case canSetCategory = "can_set_category"
        case canDoubtCategory = "can_doubt_category"
        case topicID = "topic_id"
        case edited
    }
}

// MARK: - ItemAttachment
struct ItemAttachment: Codable {  
    let type: AttachmentType?
    let photo: LinkPhoto?
    let link: Link?
    let video: AttachmentVideo?
    let doc: Doc?
}

// MARK: - Doc
struct Doc: Codable {
    let id, ownerID: Int?
    let title: String?
    let size: Int?
    let ext: String?
    let date, type: Int?
    let url: String?
    let preview: Preview?
    let isUnsafe: Int?
    let accessKey: String?

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, size, ext, date, type, url, preview
        case isUnsafe = "is_unsafe"
        case accessKey = "access_key"
    }
}

// MARK: - Preview
struct Preview: Codable {
    let photo: PreviewPhoto?
    let video: VideoElement?
}

// MARK: - PreviewPhoto
struct PreviewPhoto: Codable {
    let sizes: [VideoElement]?
}

// MARK: - VideoElement
struct VideoElement: Codable {
    let src: String?
    let width, height: Int?
    let type: SizeType?
    let fileSize: Int?
    let url: String?
    let withPadding: Int?

    enum CodingKeys: String, CodingKey {
        case src, width, height, type
        case fileSize = "file_size"
        case url
        case withPadding = "with_padding"
    }
}

enum SizeType: String, Codable {
    case a
    case b
    case c
    case d
    case e
    case k
    case l
    case m
    case o
    case p
    case q
    case r
    case s
    case temp
    case w
    case x
    case y
    case z
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let description: String?
    let isFavorite: Bool?
    let photo: LinkPhoto?
    let title: String?
    let target: Target?
    let caption: String?

    enum CodingKeys: String, CodingKey {
        case url, description
        case isFavorite = "is_favorite"
        case photo, title, target, caption
    }
}

// MARK: - LinkPhoto
struct LinkPhoto: Codable {
    let albumID, date, id, ownerID: Int?
    let sizes: [VideoElement]?
    let text: String?
    let userID: Int?
    let hasTags: Bool?
    let accessKey: String?
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case sizes, text
        case userID = "user_id"
        case hasTags = "has_tags"
        case accessKey = "access_key"
        case postID = "post_id"
    }
}

enum Target: String, Codable {
    case targetInternal = "internal"
}

enum AttachmentType: String, Codable {
    case doc
    case link
    case photo
    case video
}

// MARK: - AttachmentVideo
struct AttachmentVideo: Codable {
    let responseType: ResponseType?
    let accessKey: String?
    let canComment, canLike, canRepost, canSubscribe: Int?
    let canAddToFaves, canAdd, comments, date: Int?
    let description: String?
    let duration: Int?
    let image, firstFrame: [VideoElement]?
    let width, height, id, ownerID: Int?
    let title: String?
    let isFavorite: Bool?
    let trackCode: String?
    let videoRepeat: Int?
    let type: AttachmentType?
    let views, localViews, canDislike: Int?
    let platform: Platform?

    enum CodingKeys: String, CodingKey {
        case responseType = "response_type"
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case comments, date, description, duration, image
        case firstFrame = "first_frame"
        case width, height, id
        case ownerID = "owner_id"
        case title
        case isFavorite = "is_favorite"
        case trackCode = "track_code"
        case videoRepeat = "repeat"
        case type, views
        case localViews = "local_views"
        case canDislike = "can_dislike"
        case platform
    }
}

enum Platform: String, Codable {
    case youTube = "YouTube"
}

enum ResponseType: String, Codable {
    case full
}

// MARK: - Comments
struct Comments: Codable {
    let canPost, count: Int?
    let groupsCanPost: Bool?

    enum CodingKeys: String, CodingKey {
        case canPost = "can_post"
        case count
        case groupsCanPost = "groups_can_post"
    }
}

// MARK: - CopyHistory
struct CopyHistory: Codable {
    let type: PostTypeEnum?
    let attachments: [CopyHistoryAttachment]?
    let date, fromID, id, ownerID: Int?
    let postSource: CopyHistoryPostSource?
    let postType: PostTypeEnum?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case type, attachments, date
        case fromID = "from_id"
        case id
        case ownerID = "owner_id"
        case postSource = "post_source"
        case postType = "post_type"
        case text
    }
}

// MARK: - CopyHistoryAttachment
struct CopyHistoryAttachment: Codable {
    let type: AttachmentType?
    let video: AttachmentVideo?
    let photo: LinkPhoto?
    let doc: Doc?
}

// MARK: - CopyHistoryPostSource
struct CopyHistoryPostSource: Codable {
    let type: PostSourceType?
}

enum PostSourceType: String, Codable {
    case api
    case vk
}

enum PostTypeEnum: String, Codable {
    case post
}

// MARK: - Donut
struct Donut: Codable {
    let isDonut: Bool?

    enum CodingKeys: String, CodingKey {
        case isDonut = "is_donut"
    }
}

// MARK: - Likes
struct Likes: Codable {
    let canLike, count, userLikes, canPublish: Int?
    let repostDisabled: Bool?

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case count
        case userLikes = "user_likes"
        case canPublish = "can_publish"
        case repostDisabled = "repost_disabled"
    }
}

// MARK: - ItemPostSource
struct ItemPostSource: Codable {
    let type: PostSourceType?
    let platform: String?
}

// MARK: - Reposts
struct Reposts: Codable {
    let count, userReposted: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

// MARK: - Views
struct Views: Codable {
    let count: Int?
}

// MARK: - Profile
struct Profile: Codable {
    let id, sex: Int?
    let screenName: String?
    let photo50, photo100: String?
    let onlineInfo: OnlineInfo?
    let online: Int?
    let firstName, lastName: String?
    let canAccessClosed, isClosed: Bool?
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id, sex
        case screenName = "screen_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case onlineInfo = "online_info"
        case online
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case deactivated
    }
}

// MARK: - OnlineInfo
struct OnlineInfo: Codable {
    let visible, isOnline, isMobile: Bool?
    let lastSeen, appID: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isOnline = "is_online"
        case isMobile = "is_mobile"
        case lastSeen = "last_seen"
        case appID = "app_id"
    }
}
