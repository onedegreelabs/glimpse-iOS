//
//  CustomDatePicker.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 3/21/24.
//

import SwiftUI

struct CustomDatePicker: UIViewRepresentable {
    @Binding var selection: Date
    
    var frame: CGRect
    
    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .automatic
        }
        
        picker.minuteInterval = 15
        picker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged), for: .valueChanged)
        picker.frame = frame
        return picker
    }
    
    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.date = selection
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: CustomDatePicker

        init(_ datePicker: CustomDatePicker) {
            self.parent = datePicker
        }

        @objc func dateChanged(_ sender: UIDatePicker) {
            parent.selection = sender.date
        }
    }
}
