# NavigatableCollection
![](https://github.com/kagemiku/NavigatableCollection/workflows/iOS/badge.svg)

**It's better to use `UICollectionView` with `UIViewControllerRepresentable`**

`NavigatableCollection` is an UI library for showing collection view which is missed in SwiftUI.
`NavigatableCollection` provides simple and navigatable collection view for SwiftUI project.

You can try sample app by opening Xcode Project under  `NavigatableCollectionSampleApp` directory and `Run`.

![Navigatable Collection - GIF](https://user-images.githubusercontent.com/3097559/77840128-a093ff00-71be-11ea-9f0f-29194f6de75d.gif)

## Requirements
* Xcode 11+
* iOS 13+

## Installation
You can add **NavigatableCollection** to your project via Swift Package Manager.

Please click Xcode menu `File -> Swift Packages -> Add Package Dependency...` , and enter [https://github.com/kagemiku/NavigatableCollection](https://github.com/kagemiku/NavigatableCollection)

## Usage
You can show navigatable collection view if you put both `NavigatableCollectionView` and `NavigatableCellWrapper` inside of `NavigationView` as follows:

```swift
struct MainView: View {

    // Prepares DataSource type and actual data
    struct User: Identifiable {
        let id: Int
    }

    private let dataSoruce: [User] = (0..<50).map { User(id: $0) }

    // Creates a config for layout
    private let config = NavigatableCollectionViewConfig(
        columns: 3,
        hSpacing: 5.0,
        rowInsets: .init(top: 0, leading: 5, bottom: 5, trailing: 5)
    )

    var body: some View {
        NavigationView {

            // Puts `NavigatableCollectionView` inside of `NavigationView`
            NavigatableCollectionView(dataSource: dataSoruce, config: config) { user in

                // Wrapps cell content with `NavigatableCellWrapper` to enable navigation
                NavigatableCellWrapper(destination: DetailView(id: user.id)) {
                    CellView(id: user.id)   // Anything is OK if it is `View`
                }
            }
            .navigationBarTitle("Sample App")
        }
    }
}
```

Of course, you can also show simple non-navigatable collection view as follows:

```swift
var body: some View {
    // Puts `NavigatableCollectionView`
    NavigatableCollectionView(dataSource: dataSoruce, config: config) { user in
        CellView(id: user.id)   // Anything is OK if it is `View`
    }
}
```

Some layout items are costomizable via `NavigatableCollectionViewConfig`.

| Property | Description |
| :--: | :-- |
| `columns` | The number of columns for rows |
| `hSpacing` | The horizontal space between cells |
| `rowInsets` | The EdgeInsets for rows |

## Author
[kagemiku](https://github.com/kagemiku)

## License
MIT License
