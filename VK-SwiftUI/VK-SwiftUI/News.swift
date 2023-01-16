//
//  News.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import Foundation
import SwiftUI

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
    let groups: [GroupNews]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }

    init(items: [Item]?, profiles: [Profile]?, groups: [GroupNews]?, nextFrom: String?) {
        self.items = items
        self.profiles = profiles
        self.groups = groups
        self.nextFrom = nextFrom
    }
}

// MARK: - Group
class GroupNews: Codable {
    let id: Int?
    let name, screenName: String?
    let isClosed: Int?
    let type: GroupType?
    let isAdmin, isMember, isAdvertiser: Int?
    let photo50, photo100, photo200: String?

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

    init(id: Int?, name: String?, screenName: String?, isClosed: Int?, type: GroupType?, isAdmin: Int?, isMember: Int?, isAdvertiser: Int?, photo50: String?, photo100: String?, photo200: String?) {
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
class Item: Codable {
    let sourceID, date: Int?
    let isFavorite: Bool?
    let postType: PostTypeEnum?
    let text: String?
    let markedAsAds: Int?
    let attachments: [Attachment]?
    let postSource: ItemPostSource?
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?
    let views: Views?
    let donut: Donut?
    let shortTextRate: Double?
    let postID: Int?
    let type: PostTypeEnum?
    let canDoubtCategory, canSetCategory: Bool?
    let carouselOffset, topicID: Int?
    let copyHistory: [CopyHistory]?
    let canDelete, canEdit: Int?
    let canArchive, isArchived: Bool?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case isFavorite = "is_favorite"
        case postType = "post_type"
        case text
        case markedAsAds = "marked_as_ads"
        case attachments
        case postSource = "post_source"
        case comments, likes, reposts, views, donut
        case shortTextRate = "short_text_rate"
        case postID = "post_id"
        case type
        case canDoubtCategory = "can_doubt_category"
        case canSetCategory = "can_set_category"
        case carouselOffset = "carousel_offset"
        case topicID = "topic_id"
        case copyHistory = "copy_history"
        case canDelete = "can_delete"
        case canEdit = "can_edit"
        case canArchive = "can_archive"
        case isArchived = "is_archived"
    }

    init(sourceID: Int?, date: Int?, isFavorite: Bool?, postType: PostTypeEnum?, text: String?, markedAsAds: Int?, attachments: [Attachment]?, postSource: ItemPostSource?, comments: Comments?, likes: Likes?, reposts: Reposts?, views: Views?, donut: Donut?, shortTextRate: Double?, postID: Int?, type: PostTypeEnum?, canDoubtCategory: Bool?, canSetCategory: Bool?, carouselOffset: Int?, topicID: Int?, copyHistory: [CopyHistory]?, canDelete: Int?, canEdit: Int?, canArchive: Bool?, isArchived: Bool?) {
        self.sourceID = sourceID
        self.date = date
        self.isFavorite = isFavorite
        self.postType = postType
        self.text = text
        self.markedAsAds = markedAsAds
        self.attachments = attachments
        self.postSource = postSource
        self.comments = comments
        self.likes = likes
        self.reposts = reposts
        self.views = views
        self.donut = donut
        self.shortTextRate = shortTextRate
        self.postID = postID
        self.type = type
        self.canDoubtCategory = canDoubtCategory
        self.canSetCategory = canSetCategory
        self.carouselOffset = carouselOffset
        self.topicID = topicID
        self.copyHistory = copyHistory
        self.canDelete = canDelete
        self.canEdit = canEdit
        self.canArchive = canArchive
        self.isArchived = isArchived
    }
}

// MARK: - Attachment
class Attachment: Codable {
    let type: AttachmentType?
    let video: Video?
    let link: Link?
    let photo: PhotoNews?

    init(type: AttachmentType?, video: Video?, link: Link?, photo: PhotoNews?) {
        self.type = type
        self.video = video
        self.link = link
        self.photo = photo
    }
}

// MARK: - Link
class Link: Codable {
    let url: String?
    let title, caption, linkDescription: String?
    let photo: PhotoNews?
    let isFavorite: Bool?
    let target: String?

    enum CodingKeys: String, CodingKey {
        case url, title, caption
        case linkDescription = "description"
        case photo
        case isFavorite = "is_favorite"
        case target
    }

    init(url: String?, title: String?, caption: String?, linkDescription: String?, photo: PhotoNews?, isFavorite: Bool?, target: String?) {
        self.url = url
        self.title = title
        self.caption = caption
        self.linkDescription = linkDescription
        self.photo = photo
        self.isFavorite = isFavorite
        self.target = target
    }
}

// MARK: - Photo
class PhotoNews: Codable {
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
    let url: String?
    let type: String?
    let width, withPadding: Int?

    enum CodingKeys: String, CodingKey {
        case height, url, type, width
        case withPadding = "with_padding"
    }

    init(height: Int?, url: String?, type: String?, width: Int?, withPadding: Int?) {
        self.height = height
        self.url = url
        self.type = type
        self.width = width
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
    let canAddToFaves, canAdd, date: Int?
    let videoDescription: String?
    let duration: Int?
    let image, firstFrame: [Size]?
    let width, height, id, ownerID: Int?
    let title: String?
    let isFavorite: Bool?
    let trackCode: String?
    let videoRepeat: Int?
    let type: AttachmentType?
    let views, comments, localViews: Int?
    let platform: Platform?

    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case date
        case videoDescription = "description"
        case duration, image
        case firstFrame = "first_frame"
        case width, height, id
        case ownerID = "owner_id"
        case title
        case isFavorite = "is_favorite"
        case trackCode = "track_code"
        case videoRepeat = "repeat"
        case type, views, comments
        case localViews = "local_views"
        case platform
    }

    init(accessKey: String?, canComment: Int?, canLike: Int?, canRepost: Int?, canSubscribe: Int?, canAddToFaves: Int?, canAdd: Int?, date: Int?, videoDescription: String?, duration: Int?, image: [Size]?, firstFrame: [Size]?, width: Int?, height: Int?, id: Int?, ownerID: Int?, title: String?, isFavorite: Bool?, trackCode: String?, videoRepeat: Int?, type: AttachmentType?, views: Int?, comments: Int?, localViews: Int?, platform: Platform?) {
        self.accessKey = accessKey
        self.canComment = canComment
        self.canLike = canLike
        self.canRepost = canRepost
        self.canSubscribe = canSubscribe
        self.canAddToFaves = canAddToFaves
        self.canAdd = canAdd
        self.date = date
        self.videoDescription = videoDescription
        self.duration = duration
        self.image = image
        self.firstFrame = firstFrame
        self.width = width
        self.height = height
        self.id = id
        self.ownerID = ownerID
        self.title = title
        self.isFavorite = isFavorite
        self.trackCode = trackCode
        self.videoRepeat = videoRepeat
        self.type = type
        self.views = views
        self.comments = comments
        self.localViews = localViews
        self.platform = platform
    }
}

enum Platform: String, Codable {
    case empty = ""
    case youTube = "YouTube"
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
    let id, ownerID, fromID, date: Int?
    let postType: PostTypeEnum?
    let text: String?
    let attachments: [Attachment]?
    let postSource: CopyHistoryPostSource?

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case fromID = "from_id"
        case date
        case postType = "post_type"
        case text, attachments
        case postSource = "post_source"
    }

    init(id: Int?, ownerID: Int?, fromID: Int?, date: Int?, postType: PostTypeEnum?, text: String?, attachments: [Attachment]?, postSource: CopyHistoryPostSource?) {
        self.id = id
        self.ownerID = ownerID
        self.fromID = fromID
        self.date = date
        self.postType = postType
        self.text = text
        self.attachments = attachments
        self.postSource = postSource
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
    let platform: String?

    init(type: PostSourceType?, platform: String?) {
        self.type = type
        self.platform = platform
    }
}

// MARK: - Reposts
class Reposts: Codable {
    let count, userReposted, wallCount, mailCount: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
        case wallCount = "wall_count"
        case mailCount = "mail_count"
    }

    init(count: Int?, userReposted: Int?, wallCount: Int?, mailCount: Int?) {
        self.count = count
        self.userReposted = userReposted
        self.wallCount = wallCount
        self.mailCount = mailCount
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
    let screenName: String?
    let photo50, photo100: String?
    let onlineInfo: OnlineInfo?
    let online: Int?
    let firstName, lastName: String?
    let canAccessClosed, isClosed: Bool?
    let deactivated: String?
    let onlineMobile, onlineApp: Int?

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
        case onlineMobile = "online_mobile"
        case onlineApp = "online_app"
    }

    init(id: Int?, sex: Int?, screenName: String?, photo50: String?, photo100: String?, onlineInfo: OnlineInfo?, online: Int?, firstName: String?, lastName: String?, canAccessClosed: Bool?, isClosed: Bool?, deactivated: String?, onlineMobile: Int?, onlineApp: Int?) {
        self.id = id
        self.sex = sex
        self.screenName = screenName
        self.photo50 = photo50
        self.photo100 = photo100
        self.onlineInfo = onlineInfo
        self.online = online
        self.firstName = firstName
        self.lastName = lastName
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
        self.deactivated = deactivated
        self.onlineMobile = onlineMobile
        self.onlineApp = onlineApp
    }
}

// MARK: - OnlineInfo
class OnlineInfo: Codable {
    let visible: Bool?
    let lastSeen: Int?
    let isOnline: Bool?
    let appID: Int?
    let isMobile: Bool?

    enum CodingKeys: String, CodingKey {
        case visible
        case lastSeen = "last_seen"
        case isOnline = "is_online"
        case appID = "app_id"
        case isMobile = "is_mobile"
    }

    init(visible: Bool?, lastSeen: Int?, isOnline: Bool?, appID: Int?, isMobile: Bool?) {
        self.visible = visible
        self.lastSeen = lastSeen
        self.isOnline = isOnline
        self.appID = appID
        self.isMobile = isMobile
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
