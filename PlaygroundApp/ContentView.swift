import SwiftUI

struct ContentView: View {
    @State var text = "button has not been tapped"

    var body: some View {
        Text(text)
            .padding()
        Button("button") {
            text = "button was tapped"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
