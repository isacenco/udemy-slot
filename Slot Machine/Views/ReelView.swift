//
//  ReelView.swift
//  Slot Machine
//
//  Created by Ghenadie Isacenco on 30/10/2025.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview(traits: .fixedLayout(width: 220, height: 220)) {
    ReelView()
}
