//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

// swiftlint:disable discouraged_optional_boolean
public struct Post: Codable {
    public let approvedAtUTC: String?
    public let subreddit: String?
    public let selfText: String?
    public let authorFullName: String?
    public let saved: Bool?
    public let modReasonTitle: String?
    public let gilded: Int?
    public let clicked: Bool?
    public let title: String
    public let linkFlairRichText: [FlairRichText]?
    public let subredditNamePrefixed: String?
    public let hidden: Bool?
    public let pwls: Int? // What is it?
    public let linkFlairCSSClass: String?
    public let downs: Int?
    public let thumbnailHeight: Int?
    public let hideScore: Bool?
    public let name: String?
    public let quarantine: Bool?
    public let linkFlairTextColor: String?
    public let authorFlairBackgroundColor: String?
    public let subredditType: String?
    public let ups: Int?
    public let domain: String?
    public let mediaEmbed: MediaEmbed?
    public let thumbnailWidth: Int?
    public let authorFlairTemplateID: String?
    public let isOriginalContent: Bool?
    public let userReports: [String]?
    public let secureMedia: Media?
    public let isRedditMediaDomain: Bool?
    public let isMeta: Bool?
    public let category: String?
    public let secureMediaEmbed: MediaEmbed?
    public let linkFlairText: String?
    public let canModPost: Bool?
    public let score: Int?
    public let approvedBy: String?
    public let thumbnail: String?
    public let edited: Int?
    public let authorFlairCSSClass: String?
    public let authorFlairRichText: [FlairRichText]?
    public let gildings: Gildings?
    public let postHint: String?
    public let contentCategories: [String]?
    public let isSelf: Bool?
    public let modNote: String?
    public let created: Int?
    public let linkFlairType: String?
    public let wls: Int? // What is it?
    public let bannedBy: String?
    public let authorFlairType: String?
    public let contestMode: Bool?
    public let selfTextHTML: String?
    public let likes: String?
    public let suggestedSort: String?
    public let bannedAtUtc: String?
    public let viewCount: String?
    public let archived: Bool?
    public let noFollow: Bool?
    public let isCrosspostable: Bool?
    public let pinned: Bool?
    public let over18: Bool?
    public let preview: Preview?
    public let mediaOnly: Bool?
    public let linkFlairTemplateID: String?
    public let canGild: Bool?
    public let spoiler: Bool?
    public let locked: Bool?
    public let authorFlairText: String?
    public let visited: Bool?
    public let numReports: String?
    public let distinguished: String?
    public let subredditID: String?
    public let modReasonBy: String?
    public let removalReason: String?
    public let linkFlairBackgroundColor: String?
    public let id: String?
    public let isRobotIndexable: Bool?
    public let reportReasons: String?
    public let author: String?
    public let numCrossposts: Int?
    public let numComments: Int?
    public let sendReplies: Bool?
    public let whitelistStatus: String?
    public let modReports: [String]?
    public let authorPatreonFlair: Bool?
    public let authorFlairTextColor: String?
    public let permalink: String?
    public let parentWhitelistStatus: String?
    public let stickied: Bool?
    public let url: String?
    public let subredditSubscribers: Int?
    public let createdUTC: Int?
    public let media: Media?
    public let isVideo: Bool?

    public enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit = "subreddit"
        case selfText = "selftext"
        case authorFullName = "author_fullname"
        case saved = "saved"
        case modReasonTitle = "mod_reason_title"
        case gilded = "gilded"
        case clicked = "clicked"
        case title = "title"
        case linkFlairRichText = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden = "hidden"
        case pwls = "pwls"
        case linkFlairCSSClass = "link_flair_css_class"
        case downs = "downs"
        case thumbnailHeight = "thumbnail_height"
        case hideScore = "hide_score"
        case name = "name"
        case quarantine = "quarantine"
        case linkFlairTextColor = "link_flair_text_color"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups = "ups"
        case domain = "domain"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category = "category"
        case secureMediaEmbed = "secure_mediaEmbed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score = "score"
        case approvedBy = "approved_by"
        case thumbnail = "thumbnail"
        case edited = "edited"
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichText = "author_flair_richtext"
        case gildings = "gildings"
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created = "created"
        case linkFlairType = "link_flair_type"
        case wls = "wls"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case contestMode = "contest_mode"
        case selfTextHTML = "selftext_html"
        case likes = "likes"
        case suggestedSort = "suggested_sort"
        case bannedAtUtc = "banned_at_utc"
        case viewCount = "view_count"
        case archived = "archived"
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned = "pinned"
        case over18 = "over_18"
        case preview = "preview"
        case mediaOnly = "media_only"
        case linkFlairTemplateID = "link_flair_template_id"
        case canGild = "can_gild"
        case spoiler = "spoiler"
        case locked = "locked"
        case authorFlairText = "author_flair_text"
        case visited = "visited"
        case numReports = "num_reports"
        case distinguished = "distinguished"
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id = "id"
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author = "author"
        case numCrossposts = "num_crossposts"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink = "permalink"
        case parentWhitelistStatus = "parent_whitelistStatus"
        case stickied = "stickied"
        case url = "url"
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case media = "media"
        case isVideo = "is_video"
    }
}

public extension Post {
    // swiftlint:disable function_body_length
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        approvedAtUTC = try values.decodeIfPresent(String.self, forKey: .approvedAtUTC)
        subreddit = try values.decodeIfPresent(String.self, forKey: .subreddit)
        selfText = try values.decodeIfPresent(String.self, forKey: .selfText)
        authorFullName = try values.decodeIfPresent(String.self, forKey: .authorFullName)
        saved = try values.decodeIfPresent(Bool.self, forKey: .saved)
        modReasonTitle = try values.decodeIfPresent(String.self, forKey: .modReasonTitle)
        gilded = try values.decodeIfPresent(Int.self, forKey: .gilded)
        clicked = try values.decodeIfPresent(Bool.self, forKey: .clicked)
        title = try values.decode(String.self, forKey: .title)
        linkFlairRichText = try values.decodeIfPresent([FlairRichText].self, forKey: .linkFlairRichText)
        subredditNamePrefixed = try values.decodeIfPresent(String.self, forKey: .subredditNamePrefixed)
        hidden = try values.decodeIfPresent(Bool.self, forKey: .hidden)
        pwls = try values.decodeIfPresent(Int.self, forKey: .pwls)
        linkFlairCSSClass = try values.decodeIfPresent(String.self, forKey: .linkFlairCSSClass)
        downs = try values.decodeIfPresent(Int.self, forKey: .downs)
        thumbnailHeight = try values.decodeIfPresent(Int.self, forKey: .thumbnailHeight)
        hideScore = try values.decodeIfPresent(Bool.self, forKey: .hideScore)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        quarantine = try values.decodeIfPresent(Bool.self, forKey: .quarantine)
        linkFlairTextColor = try values.decodeIfPresent(String.self, forKey: .linkFlairTextColor)
        authorFlairBackgroundColor = try values.decodeIfPresent(String.self, forKey: .authorFlairBackgroundColor)
        subredditType = try values.decodeIfPresent(String.self, forKey: .subredditType)
        ups = try values.decodeIfPresent(Int.self, forKey: .ups)
        domain = try values.decodeIfPresent(String.self, forKey: .domain)
        mediaEmbed = try values.decodeIfPresent(MediaEmbed.self, forKey: .mediaEmbed)
        thumbnailWidth = try values.decodeIfPresent(Int.self, forKey: .thumbnailWidth)
        authorFlairTemplateID = try values.decodeIfPresent(String.self, forKey: .authorFlairTemplateID)
        isOriginalContent = try values.decodeIfPresent(Bool.self, forKey: .isOriginalContent)
        userReports = try values.decodeIfPresent([String].self, forKey: .userReports)
        secureMedia = try values.decodeIfPresent(Media.self, forKey: .secureMedia)
        isRedditMediaDomain = try values.decodeIfPresent(Bool.self, forKey: .isRedditMediaDomain)
        isMeta = try values.decodeIfPresent(Bool.self, forKey: .isMeta)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        secureMediaEmbed = try values.decodeIfPresent(MediaEmbed.self, forKey: .secureMediaEmbed)
        linkFlairText = try values.decodeIfPresent(String.self, forKey: .linkFlairText)
        canModPost = try values.decodeIfPresent(Bool.self, forKey: .canModPost)
        score = try values.decodeIfPresent(Int.self, forKey: .score)
        approvedBy = try values.decodeIfPresent(String.self, forKey: .approvedBy)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        edited = try? values.decode(Int.self, forKey: .edited)
        authorFlairCSSClass = try values.decodeIfPresent(String.self, forKey: .authorFlairCSSClass)
        authorFlairRichText = try values.decodeIfPresent([FlairRichText].self, forKey: .authorFlairRichText)
        gildings = try values.decodeIfPresent(Gildings.self, forKey: .gildings)
        postHint = try values.decodeIfPresent(String.self, forKey: .postHint)
        contentCategories = try values.decodeIfPresent([String].self, forKey: .contentCategories)
        isSelf = try values.decodeIfPresent(Bool.self, forKey: .isSelf)
        modNote = try values.decodeIfPresent(String.self, forKey: .modNote)
        created = try values.decodeIfPresent(Int.self, forKey: .created)
        linkFlairType = try values.decodeIfPresent(String.self, forKey: .linkFlairType)
        wls = try values.decodeIfPresent(Int.self, forKey: .wls)
        bannedBy = try values.decodeIfPresent(String.self, forKey: .bannedBy)
        authorFlairType = try values.decodeIfPresent(String.self, forKey: .authorFlairType)
        contestMode = try values.decodeIfPresent(Bool.self, forKey: .contestMode)
        selfTextHTML = try values.decodeIfPresent(String.self, forKey: .selfTextHTML)
        likes = try values.decodeIfPresent(String.self, forKey: .likes)
        suggestedSort = try values.decodeIfPresent(String.self, forKey: .suggestedSort)
        bannedAtUtc = try values.decodeIfPresent(String.self, forKey: .bannedAtUtc)
        viewCount = try values.decodeIfPresent(String.self, forKey: .viewCount)
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived)
        noFollow = try values.decodeIfPresent(Bool.self, forKey: .noFollow)
        isCrosspostable = try values.decodeIfPresent(Bool.self, forKey: .isCrosspostable)
        pinned = try values.decodeIfPresent(Bool.self, forKey: .pinned)
        over18 = try values.decodeIfPresent(Bool.self, forKey: .over18)
        preview = try values.decodeIfPresent(Preview.self, forKey: .preview)
        mediaOnly = try values.decodeIfPresent(Bool.self, forKey: .mediaOnly)
        linkFlairTemplateID = try values.decodeIfPresent(String.self, forKey: .linkFlairTemplateID)
        canGild = try values.decodeIfPresent(Bool.self, forKey: .canGild)
        spoiler = try values.decodeIfPresent(Bool.self, forKey: .spoiler)
        locked = try values.decodeIfPresent(Bool.self, forKey: .locked)
        authorFlairText = try values.decodeIfPresent(String.self, forKey: .authorFlairText)
        visited = try values.decodeIfPresent(Bool.self, forKey: .visited)
        numReports = try values.decodeIfPresent(String.self, forKey: .numReports)
        distinguished = try values.decodeIfPresent(String.self, forKey: .distinguished)
        subredditID = try values.decodeIfPresent(String.self, forKey: .subredditID)
        modReasonBy = try values.decodeIfPresent(String.self, forKey: .modReasonBy)
        removalReason = try values.decodeIfPresent(String.self, forKey: .removalReason)
        linkFlairBackgroundColor = try values.decodeIfPresent(String.self, forKey: .linkFlairBackgroundColor)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        isRobotIndexable = try values.decodeIfPresent(Bool.self, forKey: .isRobotIndexable)
        reportReasons = try values.decodeIfPresent(String.self, forKey: .reportReasons)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        numCrossposts = try values.decodeIfPresent(Int.self, forKey: .numCrossposts)
        numComments = try values.decodeIfPresent(Int.self, forKey: .numComments)
        sendReplies = try values.decodeIfPresent(Bool.self, forKey: .sendReplies)
        whitelistStatus = try values.decodeIfPresent(String.self, forKey: .whitelistStatus)
        modReports = try values.decodeIfPresent([String].self, forKey: .modReports)
        authorPatreonFlair = try values.decodeIfPresent(Bool.self, forKey: .authorPatreonFlair)
        authorFlairTextColor = try values.decodeIfPresent(String.self, forKey: .authorFlairTextColor)
        permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
        parentWhitelistStatus = try values.decodeIfPresent(String.self, forKey: .parentWhitelistStatus)
        stickied = try values.decodeIfPresent(Bool.self, forKey: .stickied)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        subredditSubscribers = try values.decodeIfPresent(Int.self, forKey: .subredditSubscribers)
        createdUTC = try values.decodeIfPresent(Int.self, forKey: .createdUTC)
        media = try values.decodeIfPresent(Media.self, forKey: .media)
        isVideo = try values.decodeIfPresent(Bool.self, forKey: .isVideo)
    }
    // swiftlint:enable function_body_length
}
// swiftlint:enable discouraged_optional_boolean
