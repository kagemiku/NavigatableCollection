//
//  NavigatableCollectionView.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import SwiftUI

public struct NavigatableCollectionViewConfig {
    public let columns: Int

    public init(columns: Int) {
        self.columns = columns
    }
}

public struct NavigatableCollectionView<DataSource, Cell>: View where DataSource: RandomAccessCollection, DataSource.Element: Identifiable, Cell: View {

    private let dataSource: [DataSource.Element]
    private let config: NavigatableCollectionViewConfig
    private let cell: (DataSource.Element) -> Cell

    public var body: some View {
        List {
            ForEach(dataSource) { data in
                HStack {
                    ForEach(0..<3) { _ in
                        self.cell(data)
                    }
                }
            }
        }
    }

    public init(dataSource: DataSource, @ViewBuilder cell: @escaping (DataSource.Element) -> Cell) {
    public init(dataSource: DataSource, config: NavigatableCollectionViewConfig, @ViewBuilder cell: @escaping (DataSource.Element) -> Cell) {
        self.dataSource = dataSource.map { $0 }
        self.config = config
        self.cell = cell
    }
}
