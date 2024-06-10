//
//  ParticipantModel.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/9/24.
//

import Foundation

struct GetParticipantDto: Codable {
    let statusCode: Int
    let data: [ParticipantData]
}
struct ParticipantData: Codable, Identifiable {
    let createdAt: String
    let updatedAt: String
    let id: Int
    let eventId: Int
    let role: [String]
    let purpose: String
    let user: [ParticipantUser]
    let participantInterest: [ParticipantInterest]
}

struct ParticipantUser: Codable {
    let id: Int
    let familyName: String
    let givenName: String
    let image: String?
    let region: String 
    let belong: String
    let sns: [SNSData]
}

struct SNSData: Codable {
    let id: Int
    let type: [String]
    let account: String
}

struct ParticipantInterest: Codable {
    let id: Int
    let interest: [InterestData]
}
struct InterestData: Codable {
    let id: Int
    let name: String
}
