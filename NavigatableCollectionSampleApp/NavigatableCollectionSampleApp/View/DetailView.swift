//
//  DetailView.swift
//  NavigatableCollectionSampleApp
//
//  Created by kagemiku on 2020/03/28.
//  Copyright © 2020 kagemiku. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    private let id: Int

    var body: some View {
        VStack {
            Image("dummy_cell_image")
                .resizable()
                .scaledToFit()

            Text("ID: \(id)")
        }
    }

    init(id: Int) {
        self.id = id
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 0)
    }
}
