//
//  NavigatableCellWrapper.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import SwiftUI

/// A wrapper view that navigate to another view when tapped
public struct NavigatableCellWrapper<Label, Destination>: View where Label: View, Destination: View {

    @State private var navigationActive = false

    private let destination: Destination
    private let label: () -> Label

    public var body: some View {
        ZStack {
            Button(action: {
                self.navigationActive = true
            }) {
                label()
            }
            .buttonStyle(PlainButtonStyle())

            NavigationLink(destination: destination, isActive: $navigationActive) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .hidden()
        }
    }

    /// Creates an instance that presents `destination`
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

}
