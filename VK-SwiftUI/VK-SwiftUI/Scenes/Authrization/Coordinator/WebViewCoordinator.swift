//
//  WebViewCoordinator.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import WebKit

// MARK: - WebViewCoordinator
final class WebViewCoordinator: NSObject {
  
    // MARK: Properties
    var didStart: () -> Void
    var didFinish: () -> Void
    var didLogin: () -> Void
  
    // MARK: Initializer
    init(
        didStart: @escaping () -> Void = {},
        didFinish: @escaping () -> Void = {},
        didLogin: @escaping () -> Void = {}
    ) {
        self.didStart = didStart
        self.didFinish = didFinish
        self.didLogin = didLogin
    }
}

// MARK: - WKNavigationDelegate
extension WebViewCoordinator: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: (WKNavigationResponsePolicy) -> Void
    ) {
        guard
            let url = navigationResponse.response.url,
            url.path == Constants.redirectPath,
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let parameters = fragment
          .components(separatedBy: "&")
          .map { $0.components(separatedBy: "=") }
          .reduce([String: String]()) { result, params in
            var dict = result
            let key = params[0]
            let value = params[1]
            dict[key] = value
            return dict
          }
        guard
            let token = parameters[Constants.accessTokenKey],
            let userIDString = parameters[Constants.userIDKey]
        else {
            decisionHandler(.allow)
            return
        }
        didLogin()
        AuthenticationManager.shared.setAccessToken(token: token)
        AuthenticationManager.shared.setClientID(id: userIDString)
        decisionHandler(.cancel)
    }
    
    func webView(
        _ webView: WKWebView,
        didFailProvisionalNavigation navigation: WKNavigation!,
        withError error: Error
    ) {
        print(error)
    }
}

// MARK: - Constants
private extension WebViewCoordinator {
  	enum Constants {
  	    static let redirectPath: String = "/blank.html"
  	    static let accessTokenKey: String = "access_token"
  	    static let userIDKey: String = "user_id"
  	}
}
