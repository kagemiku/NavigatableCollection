//
//  ContentView.swift
//  NavigatableCollectionSampleApp
//
//  Created by kagemiku on 2020/03/28.
//  Copyright © 2020 kagemiku. All rights reserved.
//

import SwiftUI
import NavigatableCollection

struct ContentView: View {

    struct User: Identifiable {
        let id: Int
    }

    private let dataSoruce: [User] = (0..<10).map { User(id: $0) }

    var body: some View {
        NavigatableCollectionView(dataSource: dataSoruce) { user in
            Text("\(user.id)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
