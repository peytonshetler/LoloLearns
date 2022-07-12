//
//  FlashCardView.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import SwiftUI

struct FlashCardView: View {
    @State var card: FlashCard
    
    let voiceManager = VoiceManager()
    
    var body: some View {
        VStack {
            Button {
                voiceManager.speak(word: card.name)
            } label: {
                Text(card.symbol)
                    .font(.system(size: 200))
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(card.name)
                .foregroundColor(.black)
                .lineLimit(1)
                .font(
                    .system(
                        size: card.fontSize,
                        weight: .semibold,
                        design: .rounded
                    )
                )

            Spacer()
        }
    }
}
