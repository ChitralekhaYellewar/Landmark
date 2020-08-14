//
//  Badge.swift
//  Landmarks
//
//  Created by Chitralekha Yellewar on 12/08/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Self.rotationCount) { i in
            RotatedBadgeSymbol(angle: .init(degrees: Double(i) / Double(Self.rotationCount)) * 360)
                .opacity(0.5)
        }
        
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(CGPoint(x: geometry.size.width / 2.0 , y: (3.0 / 4.0) * geometry.size.height))
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
