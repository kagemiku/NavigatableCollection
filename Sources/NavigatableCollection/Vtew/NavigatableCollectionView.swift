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

    private struct RowData: Identifiable {
        let id: DataSource.Element.ID
        let columnDataList: [DataSource.Element]
    }

    private let dataSource: [DataSource.Element]
    private let config: NavigatableCollectionViewConfig
    private let cell: (DataSource.Element) -> Cell

    public var body: some View {
        List {
            ForEach(rows) { row in
                HStack {
                    ForEach(row.columnDataList) { columnData in
                        self.cell(columnData)
                    }
                }
            }
        }
    }

    private var rows: [RowData] {
        dataSource
            .split(by: config.columns)
            .map { .init(id: $0.first!.id, columnDataList: $0) }
    }

    public init(dataSource: DataSource, config: NavigatableCollectionViewConfig, @ViewBuilder cell: @escaping (DataSource.Element) -> Cell) {
        self.dataSource = dataSource.map { $0 }
        self.config = config
        self.cell = cell
    }
}
