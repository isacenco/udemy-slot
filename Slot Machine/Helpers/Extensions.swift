//
//  Extensions.swift
//  Slot Machine
//
//  Created by Ghenadie Isacenco on 30/10/2025.
//

import SwiftUI

extension Text {
    func scoreLabelStype() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
