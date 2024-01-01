//
//  LoginWebView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import SwiftUI
import WebKit

// MARK: - LoginWebView
struct LoginWebView: UIViewRepresentable {
  
    // MARK: Properties
    @Binding var showLoading: Bool
    @Binding var isLogin: Bool
    
     var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Secrets.clientID),
            URLQueryItem(name: "client_secret", value: Secrets.clientSecret),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
    ]
        return urlComponents
    }()

    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)
        return webView
    }

    func updateUIView(_ webView: UIViewType, context: Context) {
    }

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator {
            showLoading = true
        }
        didFinish: {
            showLoading = false
        }
        didLogin: {
            isLogin = true
            UserDefaults.standard.set(true, forKey: UserDefaults.Keys.isLogin)
        }
    }
}
