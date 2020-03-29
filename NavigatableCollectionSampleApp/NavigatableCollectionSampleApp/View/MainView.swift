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

    private let dataSoruce: [User] = (0..<50).map { User(id: $0) }
    private let config = NavigatableCollectionViewConfig(
        columns: 3,
        hSpacing: 5.0,
        rowInsets: .init(top: 0, leading: 5, bottom: 5, trailing: 5)
    )

    var body: some View {
        NavigationView {
            NavigatableCollectionView(dataSource: dataSoruce, config: config) { user in
                NavigatableCellWrapper(destination: DetailView(id: user.id)) {
                    CellView(id: user.id)
                }
            }
            .navigationBarTitle("Sample App")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
