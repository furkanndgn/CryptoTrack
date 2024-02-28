//
//  UIApplication.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 3.02.2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
