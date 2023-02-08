//
//  LoginWebView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import SwiftUI
import WebKit
 
struct LoginWebView: UIViewRepresentable {
    
    @Binding var showLoading: Bool
    @Binding var isLogin: Bool
    
     var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "51542327"),
            URLQueryItem(name: "client_secret", value: "AjOhPkqr7QuuaxvOEBL7"),
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
            UserDefaults.standard.set(true, forKey: "isLogin")
        }
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    let session = Session.shared
   @State private var showLoading = false

    var didStart: () ->  Void
    var didFinish: () -> Void
    var didLogin: () -> Void

    init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {
    }, didLogin: @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
        self.didLogin = didLogin
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }

    func webView( _ webView: WKWebView,
                  decidePolicyFor navigationResponse: WKNavigationResponse,
                  decisionHandler: (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
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
                let token = parameters["access_token"],
                let userIDString = parameters["user_id"],
                let userID = Int(userIDString)
            else {decisionHandler(.allow)
               return  }
        didLogin()
        session.token = token
        session.userID = userID
        print(session.userID)
        print(session.token)
        decisionHandler(.cancel)
        }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error)
    }

}
