//
//  CardCarouselView.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import SwiftUI

struct CardCarouselView: View {
    @GestureState private var dragState: DragState = .inactive
    @State private var carouselLocation = 0
    
    var cards: [FlashCard]
    var cardHeight: CGFloat = 400
    var cardWidth: CGFloat = 300
    
    private var cardsCount: Int {
        return cards.count
    }
    
    private var relativeLocation: Int {
        return ((cardsCount * 10000) + carouselLocation) % cardsCount
    }
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(cards) { card in
        
                    VStack {
                        Spacer()

                        FlashCardView(card: card)
                        
                        .frame(width: cardWidth, height: self.getHeight(card.index))
                        .animation(
                            .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0),
                            value: dragState.isDragging
                        )

                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 8)

                        .opacity(self.getOpacity(card.index))
                        .animation(
                            .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0),
                            value: dragState.isDragging
                        )

                        .offset(x: self.getOffset(card.index))
                        .animation(
                            .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0),
                            value: dragState.isDragging
                        )

                        Spacer()
                    }
                }
            }.gesture(
                
                DragGesture()
                    .updating($dragState) { drag, state, transaction in
                        state = .dragging(translation: drag.translation)
                }
                .onEnded(onDragEnded)
                
            )
            
            Spacer()
        }
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold: CGFloat = 200
        
        if drag.predictedEndTranslation.width > dragThreshold ||
           drag.translation.width > dragThreshold {
            
            carouselLocation =  carouselLocation - 1
        } else if drag.predictedEndTranslation.width < (dragThreshold * -1) ||
                  drag.translation.width < (dragThreshold * -1) {
            carouselLocation =  carouselLocation + 1
        }
    }
    
    
    /// Sets the height of the card depending on
    /// whether or not it's in focus
    func getHeight(_ index: Int) -> CGFloat{
        return index == relativeLocation ? cardHeight : (cardHeight - 100)
    }
    

    /// If the user is on the "last" card,
    /// the "first" card in the list will have opacity of 0
    /// and vice versa
    func getOpacity(_ index: Int) -> Double {
        let shouldBeVisible: Bool = index == relativeLocation ||
                                    index + 1 == relativeLocation ||
                                    index - 1 == relativeLocation ||
                                    index + 2 == relativeLocation ||
                                    index - 2 == relativeLocation ||
                                    index + cardsCount == relativeLocation ||
                                    (index + 2) - cardsCount == relativeLocation ||
                                    index + cardsCount == relativeLocation
        
        return shouldBeVisible ? 1 : 0
    }
    
    
    func getOffset(_ index: Int) -> CGFloat {
        
        /// Sets offset of card in focus
        if index == relativeLocation {
            return self.dragState.translation.width
            
        /// Offset of cards to the left/right of main card
        } else if index == (relativeLocation + 1) ||
                  relativeLocation == (cardsCount - 1) && (index == 0) {
            
            return self.dragState.translation.width + (300 + 20)
            
        } else if index == (relativeLocation - 1) ||
                  relativeLocation == 0 && index == (cardsCount - 1) {
            
            return self.dragState.translation.width - (300 + 20)
            
        } else if index == (relativeLocation + 2) ||
                  relativeLocation == (cardsCount - 1) && (index == 1) ||
                  relativeLocation == (cardsCount - 2) && (index == 0) {
            
            return self.dragState.translation.width + (2 * (300 + 20))
        
        } else if index == (relativeLocation - 2) ||
                  relativeLocation == 1 && index == (cardsCount - 1) ||
                  relativeLocation == 0 && index == (cardsCount - 2) {
            
            return self.dragState.translation.width - (2 * (300 + 20))
            
        } else if index == (relativeLocation + 3) ||
                  relativeLocation == (cardsCount-1) && (index == 2) ||
                  relativeLocation == (cardsCount-2) && (index == 1) ||
                  relativeLocation == (cardsCount-3) && (index == 0) {
            
            return self.dragState.translation.width + (3 * (300 + 20))
            
        } else if index == (relativeLocation - 3) ||
                  relativeLocation == 2 && index == (cardsCount - 1) ||
                  relativeLocation == 1 && index == (cardsCount - 2) ||
                  relativeLocation == 0 && index == (cardsCount - 3) {
            
            return self.dragState.translation.width - (3 * (300 + 20))
        
        /// Hide all remaining cards offscreen
        } else {
            return 10000
        }
    }
}


enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

