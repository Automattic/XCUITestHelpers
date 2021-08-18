import SwiftUI

struct DummyListItem: Identifiable {

    let text: String

    var id: String { text }

    static let dummyValues: [DummyListItem] = "abcdefghijklmnopqrstuvwxyz"
        .map { char in
            DummyListItem(text: String(char))
        }
}

struct ContentView: View {
    @State var text = "button has not been tapped"

    var body: some View {
        VStack {
            Text(text)
                .padding()
            Button("button") {
                text = "button was tapped"
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
