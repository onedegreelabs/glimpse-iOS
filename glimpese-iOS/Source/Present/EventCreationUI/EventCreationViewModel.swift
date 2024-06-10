//
//  EventCreationViewModel.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 2024/1/3.
//

import UIKit
import Combine

class EventCreationViewModel: ObservableObject {
    @Published var event = Event(title: "", type: "Virtual", visibility: "Public", location: "", link: "", url: "", description: "", tags: [], coverImage: nil)
    @Published var newTag: String = ""
    
    func addTag(_ tag: String) {
        let cleanedTag = tag.trimmingCharacters(in: .whitespacesAndNewlines)
        if !cleanedTag.isEmpty && event.tags.count < 20 {
            event.tags.append(cleanedTag)
        }
    }
    
    func removeTag(_ tag: String) {
        event.tags.removeAll { $0 == tag }
    }
    
    func selectImage(_ image: UIImage?) {
        event.coverImage = image
    }
    
    func publishEvent() {

    }
}

