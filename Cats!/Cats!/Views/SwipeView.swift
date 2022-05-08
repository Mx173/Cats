//
//  SwipeView.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/05/01.
//

import SwiftUI

struct SwipeView: View {
    @EnvironmentObject var catsVM: CatsViewModel
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(catsVM.catList.count - id) * 10
            return geometry.size.width - 30 - offset
        }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
            return  CGFloat(catsVM.catList.count - 1 - id) * 10
        }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HStack{
                    //Spacer()
                    ZStack {
                        ForEach (Array(catsVM.catList.enumerated()), id: \.offset) { index, card in
                            if (catsVM.catList.count - 3)...catsVM.catList.count ~= index + 1 {
                                CatCardView(cat: card,
                                            onRemove: { catsVM.catList.popLast() },
                                            width: self.getCardWidth(geometry, id: index + 1),
                                            offsetY: self.getCardOffset(geometry, id: index + 1))
                            }
                        }
                    }
                    .navigationBarTitle(Text("Choose your Cat!"))
                    .padding(.top)
                    .frame(width: geometry.size.width)
                    //Spacer()
                }
                
            }
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView().environmentObject(CatsViewModel())
    }
}
