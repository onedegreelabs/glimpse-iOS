//
//  FilterData.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/12.
//

import Foundation

struct FilterData {
    
    static let FilterTexts: [String] = [
        "Participant", "Industry", "Location",
        "Hobby", "Favorite", "Interest"
    ]
    
    static let participantTexts: [String] = ["All", "Guest", "Host"]
    
    static let industryTexts: [String] = [
        "AMD", "Business Management", "Business Operation",
        "Business Planning", "CS", "Data", "Designer",
        "Engineer", "Information Security", "Marketing",
        "MD", "Operational Support", "PM",
        "Sales", "Strategy", "Others"
    ]
    
    static let locationTexts: [String] = [
        "Canada", "China", "France", "Germany",
        "Japan", "Korea", "USA", "Others"
    ]
    
    static let hobbyTexts: [String] = [
        "Cooking", "Dancing", "Fishing", "Football", "Jogging",
        "K-Pop", "Listening to Music", "Singing","Studying Coding",
        "Studying Languages","Swimming","Tennis", "Travelling",
        "Watching TV", "Yoga", "Others"
    ]
    
    static let favoriteTexts: [String] = [
        "Books", "Car", "Cat", "Chatter","Chinese Food",
        "Drinks", "Games", "Interior","Japanese Food",
        "Korean Food", "Puppy", "Shoes","Shopping",
        "Tea", "Western Food", "Others"
    ]
    
    static let interestTexts: [String] = [
        "Cooking", "Dancing", "Fishing", "Football",
        "Jogging", "K-Pop", "Listening to Music", "Singing",
        "Studying Coding", "Studying Languages", "Swimming", "Tennis",
        "Travelling", "Watching TV", "Yoga", "Others"
    ]
}
