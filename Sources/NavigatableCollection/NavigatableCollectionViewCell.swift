//
//  NavigatableCollectionViewCell.swift
//  NavigatableCollection
//
//  Created by kagemiku on 2020/03/28.
//

import SwiftUI

public struct NavigatableCollectionViewCell<Label, Destination>: View where Label: View, Destination: View {

    @State private var navigationActive = false

    private let destination: Destination
    private let label: Label

    public var body: some View {
        Group {
            Button(action: {
                self.navigationActive = true
            }) {
                label
            }
            .buttonStyle(PlainButtonStyle())

            NavigationLink(destination: destination, isActive: $navigationActive) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .hidden()
        }
    }

    public init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }

}
