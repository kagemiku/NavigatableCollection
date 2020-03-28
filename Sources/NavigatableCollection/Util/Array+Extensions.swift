//
//  Array+Extensions.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import Foundation

extension Array {

    /// Sprit array into sub arrays which has up to `chunkSize` elements
    /// Before:  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] with chunkSize = 5
    /// After: [
    ///     [1, 2, 3, 4, 5],
    ///     [6, 7, 8, 9, 10],
    ///     [11, 12],
    /// ]
    func split(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, count)])
        }
    }

}
