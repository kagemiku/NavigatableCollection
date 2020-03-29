//
//  NavigatableCollectionView.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import SwiftUI

public struct NavigatableCollectionViewConfig {
    public let columns: Int
    public let hSpacing: CGFloat
    public let rowInsets: EdgeInsets

    public init(columns: Int, hSpacing: CGFloat = 0, rowInsets: EdgeInsets = .init()) {
        self.columns = columns
        self.hSpacing = hSpacing
        self.rowInsets = rowInsets
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

    private let oldSeparatorStyle: UITableViewCell.SeparatorStyle

    public var body: some View {
        GeometryReader { geometry in
            List {
                ForEach(self.rows) { row in
                    self.rowContent(row, geometry: geometry)
                }
                .listRowInsets(self.config.rowInsets)
            }
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = self.oldSeparatorStyle
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
        self.oldSeparatorStyle = UITableView.appearance().separatorStyle
    }

    private func rowContent(_ row: RowData, geometry: GeometryProxy) -> some View {
        return HStack(spacing: config.hSpacing) {
            ForEach(row.columnDataList) { columnData in
                self.cell(columnData)
                    .frame(width: self.cellWidth(geometry))
            }
        }
    }

    private func cellWidth(_ geometry: GeometryProxy) -> CGFloat {
        let totalSpacing = config.hSpacing * CGFloat(config.columns - 1)
        let totalInsets = config.rowInsets.leading + config.rowInsets.trailing
        let width = geometry.size.width - totalSpacing - totalInsets

        return width / CGFloat(config.columns)
    }

}
