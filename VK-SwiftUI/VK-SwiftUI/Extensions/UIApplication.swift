//
//  UIApplication.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.02.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
