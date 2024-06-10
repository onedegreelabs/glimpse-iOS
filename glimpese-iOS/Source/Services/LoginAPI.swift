//
//  LoginAPI.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/25/24.
//

import Foundation
import Moya

class Login {
    
    static let shared = Login()
    var otpText = ""
    
    enum API {
        // MARK: 이메일로 인증 코드 요청
        case sendMailCode(email: String)
        
        // MARK: 로그인 (토큰 발급)
        case login
        
        // MARK: 로그아웃
        case logout
        
        // MARK: 토큰 재발급
        case tokenReIssue
        
        // MARK: 빠른 로그인
        case fastLogin(email: String)
        
    }
}

extension Login.API: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.glimpse.rsvp/v1")!
    }

    var path: String {
        switch self {
        case .sendMailCode:
            return "/auth/email/request-code"
        case .logout, .login, .tokenReIssue:
            return "/auth/token"
        case .fastLogin(let email):
            return "/auth/token/\(email)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .sendMailCode:
            return .post
        case .logout:
            return .delete
        case .fastLogin, .login:
            return .get
        case .tokenReIssue:
            return .put
        }
    }

    var task: Moya.Task {
        switch self {
        case .logout, .fastLogin(_), .login, .tokenReIssue:
            return .requestPlain
        case .sendMailCode(email: let email):
            let parameters: [String: Any] = ["email": email]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        if let savedEmail = UserDefaults.standard.string(forKey: "userEmail") {
            if let authData = "\(savedEmail):\(Login.shared.otpText)".data(using: .utf8) {
                let base64AuthData = authData.base64EncodedString()
                headers["Authorization"] = "Basic \(base64AuthData)"
            }
        }
        return headers
    }

}
