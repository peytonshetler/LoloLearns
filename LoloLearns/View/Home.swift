//
//  Home.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/12/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                CardCarouselView(cards: FlashCard.getDeck())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [.blue.opacity(0.92), .blue,],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
        }
        
    }
}
