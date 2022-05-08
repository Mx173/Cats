//
//  SwiftUIView.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/04/23.
//

import SwiftUI

struct ImageCellView: View {
    @State var cat: Cat!
    
    var body: some View {
        AsyncImage(url: URL(string: cat.url),
                   content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .cornerRadius(15)
                             .padding()
                             
                    },
                   placeholder: {
                       ProgressView()
                   })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCellView()
    }
}
