//
//  CatCardView.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/05/01.
//

import SwiftUI

struct CatCardView: View {
    @State var cat: Cat!
    @State private var translation: CGSize = .zero
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
            gesture.translation.width / geometry.size.width
        }
    
    var onRemove: () -> Void
    var width: CGFloat
    var offsetY: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: cat.url),
                       content: { image in
                image.resizable()
                     .scaledToFill()
                     .frame(width: width, height: 500, alignment: .center)
                     
                     .clipped()
                     .cornerRadius(15)
                     .shadow(color: .gray, radius: 5)
                     .frame(width: geometry.size.width)
                     .offset(x: self.translation.width, y: offsetY)
                     .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
                     .gesture(
                         DragGesture()
                             .onChanged { value in
                                 self.translation = value.translation
                             }
                             .onEnded { value in
                                 if abs(self.getGesturePercentage(geometry, from: value)) > 0.5 {
                                     withAnimation {
                                         self.onRemove()
                                     }
                                 } else {
                                     withAnimation  {
                                         self.translation = .zero
                                     }
                                 }
                             }
                     )
            },
                       placeholder: { ProgressView() }
            )
        }
    }
}

struct CatCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardView(cat: Cat(),
                    onRemove: {  },
                    width: 350,
                    offsetY: 10
        )
    }
}
