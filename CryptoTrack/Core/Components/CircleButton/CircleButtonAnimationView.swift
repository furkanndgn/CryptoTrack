//
//  CircleButtonAnimationView.swift
//  CryptoTrack
//
//  Created by Furkan Doğan on 29.11.2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool

    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeInOut : nil, value: UUID())
        
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}

