import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 20) {
            StatefulTextWithButton()
            Matrix()
            DummyList()
        }
    }
}

/// A view consisting of a text label and a button. When the button is tapped, the text in the
/// label changes.
struct StatefulTextWithButton: View {

    @State var text = "button has not been tapped"

    var body: some View {
        VStack {
            Text(text)
            Button("button") {
                text = "button was tapped"
            }
        }
    }
}

/// A view with a matrix of text subviews. Use it to test methods that compute how views are relative to
/// each other
struct Matrix: View {

    var body: some View {
        VStack {
            HStack {
                Text("x1-y1")
                Text("x2-y1")
                Text("x3-y1")
            }
            HStack {
                Text("x1-y2")
                Text("x2-y2")
                Text("x3-y2")
            }
        }
        // Using monospace font to ensure constant relative positioning.
        .font(.system(.body, design: .monospaced))
    }
}

/// A `List` showing dummy items. Use it to test basic list interaction behaviors, like scrolling
/// and finding cells.
struct DummyList: View {

    struct Item: Identifiable {

        let text: String

        var id: String { text }
    }

    /// An array of `DummyList.Item`s with each element representing a letter of the English
    /// alphabet.
    let values: [Item] = "abcdefghijklmnopqrstuvwxyz".map { Item(text: "\($0)") }

    var body: some View {
        List(values) { item in
            Text(item.text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
