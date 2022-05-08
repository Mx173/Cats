//
//  MainView.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/04/22.
//

import SwiftUI

struct CatsView: View {
    @EnvironmentObject var catsVM: CatsViewModel
    
    var body: some View {
        ScrollView () {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300))], alignment: .center) {
                ForEach(catsVM.catList, id: \.self) { cat in
                    ImageCellView(cat: cat)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView().environmentObject(CatsViewModel())
    }
}
