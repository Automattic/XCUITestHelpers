import SwiftUI

struct DummyListItem: Identifiable {

    let text: String

    var id: String { text }

    static let dummyValues: [DummyListItem] = "abcdefghijklmnopqrstuvwxyz"
        .map { char in
            DummyListItem(text: String(char))
        }
}

struct MonospacedText: View {

    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.system(.body, design: .monospaced))
    }
}

struct ContentView: View {
    @State var text = "button has not been tapped"

    var body: some View {
        VStack {
            Text(text).padding()
            Button("button") {
                text = "button was tapped"
            }
            .padding()

            // Using monospace font to ensure constant relative positioning.
            HStack {
                MonospacedText("x1-y1")
                MonospacedText("x2-y1")
                MonospacedText("x3-y1")
            }
            HStack {
                MonospacedText("x1-y2")
                MonospacedText("x2-y2")
                MonospacedText("x3-y2")
            }

            List(DummyListItem.dummyValues) { item in
                Text(item.text)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
