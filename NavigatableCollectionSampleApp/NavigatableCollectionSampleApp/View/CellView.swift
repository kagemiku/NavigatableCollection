//
//  CellView.swift
//  NavigatableCollectionSampleApp
//
//  Created by kagemiku on 2020/03/29.
//  Copyright © 2020 kagemiku. All rights reserved.
//

import SwiftUI

struct CellView: View {

    private let id: Int

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("dummy_cell_image")
                .resizable()
                .scaledToFit()
            Text("id: \(id)")
                .padding(3.0)
                .foregroundColor(Color.white)
                .background(Color.black.opacity(0.6))
        }
    }

    init(id: Int) {
        self.id = id
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(id: 0)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
