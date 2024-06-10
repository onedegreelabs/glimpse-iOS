//
//  Font+.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2023/12/20.
//

import Foundation
import SwiftUI

extension Font {
    
    enum Pretendard {
        case semibold
        case medium
        case regular
        case bold
        
        var value: String {
            switch self {
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            }
        }

    }
    
    static func pretendard(_ type: Pretendard, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }

}
