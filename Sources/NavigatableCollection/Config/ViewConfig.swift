//
//  ViewConfig.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import Foundation
import SwiftUI

/// A configuration for NavigatableCollectionView
public struct NavigatableCollectionViewConfig {
    public let columns: Int
    public let hSpacing: CGFloat
    public let rowInsets: EdgeInsets

    /// Creates an instance
    /// - Parameters:
    ///   - columns: The number of columns for rows
    ///   - hSpacing: The horizontal space between cells
    ///   - rowInsets: The EdgeInsets for rows
    public init(columns: Int, hSpacing: CGFloat = 0, rowInsets: EdgeInsets = .init()) {
        self.columns = columns
        self.hSpacing = hSpacing
        self.rowInsets = rowInsets
    }
}

