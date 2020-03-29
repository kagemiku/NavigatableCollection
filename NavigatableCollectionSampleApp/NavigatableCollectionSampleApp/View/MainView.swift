//
//  MainView.swift
//  NavigatableCollectionSampleApp
//
//  Created by kagemiku on 2020/03/28.
//  Copyright © 2020 kagemiku. All rights reserved.
//

import SwiftUI
import NavigatableCollection

struct MainView: View {

    struct User: Identifiable {
        let id: Int
    }

    private let dataSoruce: [User] = (0..<10).map { User(id: $0) }
    private let config = NavigatableCollectionViewConfig(columns: 3)

    var body: some View {
        NavigationView {
            NavigatableCollectionView(dataSource: dataSoruce, config: config) { user in
                NavigatableCellWrapper(destination: DetailView(id: user.id)) {
                    CellView(id: user.id)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
