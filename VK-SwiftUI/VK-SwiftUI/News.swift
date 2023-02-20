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

import Foundation

// MARK: - News
class News: Codable {
    let response: Response?

    init(response: Response?) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let items: [Item]?
    let profiles: [Profile]?
    let groups: [NewsGroup]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }

    init(items: [Item]?, profiles: [Profile]?, groups: [NewsGroup]?, nextFrom: String?) {
        self.items = items
        self.profiles = profiles
        self.groups = groups
        self.nextFrom = nextFrom
    }
}

// MARK: - Group
class NewsGroup: Codable {
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

    init(id: Int?, name: String, screenName: String, isClosed: Int?, type: GroupType?, isAdmin: Int?, isMember: Int?, isAdvertiser: Int?, photo50: String, photo100: String, photo200: String) {
        self.id = id
        self.name = name
        self.screenName = screenName
        self.isClosed = isClosed
        self.type = type
        self.isAdmin = isAdmin
        self.isMember = isMember
        self.isAdvertiser = isAdvertiser
        self.photo50 = photo50
        self.photo100 = photo100
        self.photo200 = photo200
    }
}

enum GroupType: String, Codable {
    case group = "group"
    case page = "page"
}

// MARK: - Item
class Item: Codable, Identifiable {
    let sourceID, date: Int
    let canDoubtCategory, canSetCategory: Bool?
    let copyHistory: [CopyHistory]?
    let donut: Donut?
    let comments: Comments?
    let markedAsAds: Int?
    let shortTextRate: Double?
    let attachments: [Attachment]?
    var id: Int?
    var isFavorite: Bool?
    var likes: Likes?
    var ownerID: Int?
    let postSource: ItemPostSource?
    let postType: PostTypeEnum?
    let reposts: Reposts?
    let text: String?
    let views: Views?
    let postID: Int?
    let type: PostTypeEnum?
    let carouselOffset: Int?
    let categoryAction: CategoryAction?
    let topicID, edited: Int?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case canDoubtCategory = "can_doubt_category"
        case canSetCategory = "can_set_category"
        case copyHistory = "copy_history"
        case donut, comments
        case markedAsAds = "marked_as_ads"
        case shortTextRate = "short_text_rate"
        case attachments, id
        case isFavorite = "is_favorite"
        case likes
        case ownerID = "owner_id"
        case postSource = "post_source"
        case postType = "post_type"
        case reposts, text, views
        case postID = "post_id"
        case type
        case carouselOffset = "carousel_offset"
        case categoryAction = "category_action"
        case topicID = "topic_id"
        case edited
    }

    init(sourceID: Int, date: Int, canDoubtCategory: Bool?, canSetCategory: Bool?, copyHistory: [CopyHistory]?, donut: Donut?, comments: Comments?, markedAsAds: Int?, shortTextRate: Double?, attachments: [Attachment]?, id: Int?, isFavorite: Bool?, likes: Likes?, ownerID: Int?, postSource: ItemPostSource?, postType: PostTypeEnum?, reposts: Reposts?, text: String?, views: Views?, postID: Int?, type: PostTypeEnum?, carouselOffset: Int?, categoryAction: CategoryAction?, topicID: Int?, edited: Int?) {
        self.sourceID = sourceID
        self.date = date
        self.canDoubtCategory = canDoubtCategory
        self.canSetCategory = canSetCategory
        self.copyHistory = copyHistory
        self.donut = donut
        self.comments = comments
        self.markedAsAds = markedAsAds
        self.shortTextRate = shortTextRate
        self.attachments = attachments
        self.id = id
        self.isFavorite = isFavorite
        self.likes = likes
        self.ownerID = ownerID
        self.postSource = postSource
        self.postType = postType
        self.reposts = reposts
        self.text = text
        self.views = views
        self.postID = postID
        self.type = type
        self.carouselOffset = carouselOffset
        self.categoryAction = categoryAction
        self.topicID = topicID
        self.edited = edited
    }
}

// MARK: - Attachment
class Attachment: Codable {
    let type: AttachmentType?
    let photo: NewsPhoto?
    let video: Video?
    let link: Link?

    init(type: AttachmentType?, photo: NewsPhoto?, video: Video?, link: Link?) {
        self.type = type
        self.photo = photo
        self.video = video
        self.link = link
    }
}

// MARK: - Link
class Link: Codable {
    let url: String?
    let caption, description: String?
    let isFavorite: Bool?
    let photo: NewsPhoto?
    let title, target: String?

    enum CodingKeys: String, CodingKey {
        case url, caption, description
        case isFavorite = "is_favorite"
        case photo, title, target
    }

    init(url: String?, caption: String?, description: String?, isFavorite: Bool?, photo: NewsPhoto?, title: String?, target: String?) {
        self.url = url
        self.caption = caption
        self.description = description
        self.isFavorite = isFavorite
        self.photo = photo
        self.title = title
        self.target = target
    }
}

// MARK: - Photo
class NewsPhoto: Codable {
    let albumID, date, id, ownerID: Int?
    let sizes: [Size]?
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

    init(albumID: Int?, date: Int?, id: Int?, ownerID: Int?, sizes: [Size]?, text: String?, userID: Int?, hasTags: Bool?, accessKey: String?, postID: Int?) {
        self.albumID = albumID
        self.date = date
        self.id = id
        self.ownerID = ownerID
        self.sizes = sizes
        self.text = text
        self.userID = userID
        self.hasTags = hasTags
        self.accessKey = accessKey
        self.postID = postID
    }
}

// MARK: - Size
class Size: Codable {
    let height: Int?
    let type: String?
    let width: Int?
    let url: String?
    let withPadding: Int?

    enum CodingKeys: String, CodingKey {
        case height, type, width, url
        case withPadding = "with_padding"
    }

    init(height: Int?, type: String?, width: Int?, url: String?, withPadding: Int?) {
        self.height = height
        self.type = type
        self.width = width
        self.url = url
        self.withPadding = withPadding
    }
}

enum AttachmentType: String, Codable {
    case link = "link"
    case photo = "photo"
    case video = "video"
}

// MARK: - Video
class Video: Codable {
    let accessKey: String?
    let canComment, canLike, canRepost, canSubscribe: Int?
    let canAddToFaves, canAdd, comments, date: Int?
    let description: String?
    let duration: Int?
    let image: [Size]?
    let id, ownerID: Int?
    let title: String?
    let isFavorite: Bool?
    let trackCode: String?
    let type: AttachmentType?
    let views, localViews: Int?
    let platform: VideoPlatform?
    let firstFrame: [Size]?
    let width, height: Int?

    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case comments, date, description, duration, image, id
        case ownerID = "owner_id"
        case title
        case isFavorite = "is_favorite"
        case trackCode = "track_code"
        case type, views
        case localViews = "local_views"
        case platform
        case firstFrame = "first_frame"
        case width, height
    }

    init(accessKey: String?, canComment: Int?, canLike: Int?, canRepost: Int?, canSubscribe: Int?, canAddToFaves: Int?, canAdd: Int?, comments: Int?, date: Int?, description: String?, duration: Int?, image: [Size]?, id: Int?, ownerID: Int?, title: String?, isFavorite: Bool?, trackCode: String?, type: AttachmentType?, views: Int?, localViews: Int?, platform: VideoPlatform?, firstFrame: [Size]?, width: Int?, height: Int?) {
        self.accessKey = accessKey
        self.canComment = canComment
        self.canLike = canLike
        self.canRepost = canRepost
        self.canSubscribe = canSubscribe
        self.canAddToFaves = canAddToFaves
        self.canAdd = canAdd
        self.comments = comments
        self.date = date
        self.description = description
        self.duration = duration
        self.image = image
        self.id = id
        self.ownerID = ownerID
        self.title = title
        self.isFavorite = isFavorite
        self.trackCode = trackCode
        self.type = type
        self.views = views
        self.localViews = localViews
        self.platform = platform
        self.firstFrame = firstFrame
        self.width = width
        self.height = height
    }
}

enum VideoPlatform: String, Codable {
    case youTube = "YouTube"
}

// MARK: - CategoryAction
class CategoryAction: Codable {
    let action: Action?
    let name: String?

    init(action: Action?, name: String?) {
        self.action = action
        self.name = name
    }
}

// MARK: - Action
class Action: Codable {
    let target, type, url: String?

    init(target: String?, type: String?, url: String?) {
        self.target = target
        self.type = type
        self.url = url
    }
}

// MARK: - Comments
class Comments: Codable {
    let canPost, count: Int?
    let groupsCanPost: Bool?

    enum CodingKeys: String, CodingKey {
        case canPost = "can_post"
        case count
        case groupsCanPost = "groups_can_post"
    }

    init(canPost: Int?, count: Int?, groupsCanPost: Bool?) {
        self.canPost = canPost
        self.count = count
        self.groupsCanPost = groupsCanPost
    }
}

// MARK: - CopyHistory
class CopyHistory: Codable {
    let attachments: [Attachment]?
    let date, fromID, id, ownerID: Int?
    let postSource: CopyHistoryPostSource?
    let postType: PostTypeEnum?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case attachments, date
        case fromID = "from_id"
        case id
        case ownerID = "owner_id"
        case postSource = "post_source"
        case postType = "post_type"
        case text
    }

    init(attachments: [Attachment]?, date: Int?, fromID: Int?, id: Int?, ownerID: Int?, postSource: CopyHistoryPostSource?, postType: PostTypeEnum?, text: String?) {
        self.attachments = attachments
        self.date = date
        self.fromID = fromID
        self.id = id
        self.ownerID = ownerID
        self.postSource = postSource
        self.postType = postType
        self.text = text
    }
}

// MARK: - CopyHistoryPostSource
class CopyHistoryPostSource: Codable {
    let type: PostSourceType?

    init(type: PostSourceType?) {
        self.type = type
    }
}

enum PostSourceType: String, Codable {
    case api = "api"
    case vk = "vk"
}

enum PostTypeEnum: String, Codable {
    case post = "post"
}

// MARK: - Donut
class Donut: Codable {
    let isDonut: Bool?

    enum CodingKeys: String, CodingKey {
        case isDonut = "is_donut"
    }

    init(isDonut: Bool?) {
        self.isDonut = isDonut
    }
}

// MARK: - Likes
class Likes: Codable {
    var canLike, count, userLikes, canPublish: Int?

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case count
        case userLikes = "user_likes"
        case canPublish = "can_publish"
    }

    init(canLike: Int?, count: Int?, userLikes: Int?, canPublish: Int?) {
        self.canLike = canLike
        self.count = count
        self.userLikes = userLikes
        self.canPublish = canPublish
    }
}

// MARK: - ItemPostSource
class ItemPostSource: Codable {
    let type: PostSourceType?
    let platform: PostSourcePlatform?

    init(type: PostSourceType?, platform: PostSourcePlatform?) {
        self.type = type
        self.platform = platform
    }
}

enum PostSourcePlatform: String, Codable {
    case adminApp = "admin_app"
    case iphone = "iphone"
}

// MARK: - Reposts
class Reposts: Codable {
    let count, userReposted: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }

    init(count: Int?, userReposted: Int?) {
        self.count = count
        self.userReposted = userReposted
    }
}

// MARK: - Views
class Views: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}

// MARK: - Profile
class Profile: Codable {
    let id, sex: Int?
    let photo50, photo100: String?
    let onlineInfo: OnlineInfo?
    let online: Int?
    let deactivated, firstName, lastName: String?
    let canAccessClosed, isClosed: Bool?
    let screenName: String?

    enum CodingKeys: String, CodingKey {
        case id, sex
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case onlineInfo = "online_info"
        case online, deactivated
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case screenName = "screen_name"
    }

    init(id: Int?, sex: Int?, photo50: String?, photo100: String?, onlineInfo: OnlineInfo?, online: Int?, deactivated: String?, firstName: String?, lastName: String?, canAccessClosed: Bool?, isClosed: Bool?, screenName: String?) {
        self.id = id
        self.sex = sex
        self.photo50 = photo50
        self.photo100 = photo100
        self.onlineInfo = onlineInfo
        self.online = online
        self.deactivated = deactivated
        self.firstName = firstName
        self.lastName = lastName
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
        self.screenName = screenName
    }
}

// MARK: - OnlineInfo
class OnlineInfo: Codable {
    let visible, isOnline, isMobile: Bool?
    let lastSeen, appID: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isOnline = "is_online"
        case isMobile = "is_mobile"
        case lastSeen = "last_seen"
        case appID = "app_id"
    }

    init(visible: Bool?, isOnline: Bool?, isMobile: Bool?, lastSeen: Int?, appID: Int?) {
        self.visible = visible
        self.isOnline = isOnline
        self.isMobile = isMobile
        self.lastSeen = lastSeen
        self.appID = appID
    }
}





//class News: Identifiable {
//    var id: Int
//    var ownerName: String
//    var date: String
//    var ownerAvatar: String
//    let text: String
//    let attachments: String
//    var comments: Int
//    var likes: Int
//    var isUserLike: Bool
//    var reposts: Int
//    var views: Int
//
//    init(id: Int, ownerName: String, date: String, ownerAvatar: String, text: String, attachments: String, comments: Int, likes: Int,isUserLike: Bool, reposts: Int, views: Int) {
//        self.id = id
//        self.ownerName = ownerName
//        self.date = date
//        self.ownerAvatar = ownerAvatar
//        self.text = text
//        self.attachments = attachments
//        self.comments = comments
//        self.likes = likes
//        self.isUserLike = isUserLike
//        self.reposts = reposts
//        self.views = views
//    }
//}
