//
//  CustomImagePicker.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/17/24.
//

import SwiftUI

struct CustomImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var onFileSizeExceeded: (() -> Void)?
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CustomImagePicker

        init(_ parent: CustomImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage, let imageData = image.jpegData(compressionQuality: 1.0) {
                let imageSize = imageData.count
                let maxSize = 10 * 1024 * 1024
                if imageSize <= maxSize {
                    parent.selectedImage = image
                }
                else {
                    parent.onFileSizeExceeded?()
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
