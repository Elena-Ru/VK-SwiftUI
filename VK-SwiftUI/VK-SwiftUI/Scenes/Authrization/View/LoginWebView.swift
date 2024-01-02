//
//  LoginWebView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import SwiftUI
import WebKit

// MARK: - LoginWebView
struct LoginWebView {
    @Binding var showLoading: Bool
    @Binding var isLogin: Bool
}

// MARK: - UIViewRepresentable
extension LoginWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = createURLComponents().url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
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

// MARK: - Private Methods
private extension LoginWebView {
  	func createURLComponents() -> URLComponents {
  	    var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        urlComponents.path = Constants.path
  	    urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Secrets.clientID),
            URLQueryItem(name: "client_secret", value: Secrets.clientSecret),
            URLQueryItem(name: "display", value: Constants.display),
            URLQueryItem(name: "redirect_uri", value: Secrets.redirectURI),
            URLQueryItem(name: "scope", value: Secrets.scope),
            URLQueryItem(name: "response_type", value: Constants.responseType),
            URLQueryItem(name: "v", value: Secrets.version)
  	    ]
  	    return urlComponents
  	}
}	

// MARK: - Constants
private extension LoginWebView {
  	enum Constants {
        static let scheme: String = "https"
        static let host: String = "oauth.vk.com"
        static let path: String = "/authorize"
        static let display: String = "mobile"
        static let responseType: String = "token"
  	}
}
