//
//  EventModel.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/18.
//

import Foundation

struct GetEventDto: Codable {
    let statusCode: Int
    let data: [EventData]
}

struct EventData: Codable, Identifiable {
    let id: Int
    let title: String
    let handle: String
    let startAt: String
    let endAt: String
    let organizer: OrganizerData 
    let type: String
    let region: RegionData?
    let detailAddress: String?
    let externalLink: String?
    let coverImage: String?
}

struct OrganizerData: Codable {
    let id: Int
    let familyName: String?
    let givenName: String?
    let image: String?
}

struct RegionData: Codable {
    let oneDepth: String
    let twoDepth: String
    let threeDepth: String
}

struct GetEventByHanleDto: Codable {
    let statusCode: Int
    let data: [EventDetailData]
}

struct EventDetailData: Codable, Identifiable {
    let createdAt: String
    let updatedAt: String
    let id: Int
    let title: String
    let description: String
    let handle: String
    let coverImage: String?
    let type: String
    let region: RegionData?
    let detailAddress: String?
    let externalLink: String?
    let viewCounts: Int
    let startAt: String
    let endAt: String
    let dueAt: String
    let organizer: OrganizerData
}

struct MemberDto {
    let member: [MemberData]
}

struct MemberData {
    let name: String
    let specialization: String
    let tags: [String]
}
