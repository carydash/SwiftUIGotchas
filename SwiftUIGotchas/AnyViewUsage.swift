//
//  AnyViewUsage.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/11/21.
//

import SwiftUI

/// Source - https://developer.apple.com/videos/play/wwdc2021/10022/
struct AnyViewUsage: View {
    enum Greeting {
        case hello, sup, goodbye
    }

    var greeting: Greeting = .sup

    var body: some View {
        VStack {
            view(for: greeting)

            greeting == .sup ? view(for: .sup) : view(for: .goodbye)

            /// something something what 'if' ternary operators w/ computed vars
//            greeting == .sup ? appleView : bananaView
//            if greeting == .sup {
//                appleView
//            } else {
//                bananaView
//            }
            // if let, switch (ternary)
        }
    }

    @ViewBuilder func view(for greeting: Greeting) -> some View {
        switch greeting {
        case .hello:
            HelloView()
        case .sup:
            SupView()
        case .goodbye:
            GoodbyeView()
        }
    }

    var appleView: some View {
        Text("Apple 🍎")
    }

    var bananaView: some View {
        Text("Banana 🍌")
    }
}

struct HelloView: View {
    var body: some View {
        Text("Hello, it's me")
    }
}

struct SupView: View {
    var body: some View {
        Text("What's updog?")
    }
}

struct GoodbyeView: View {
    var body: some View {
        Text("See ya later alligator")
    }
}

struct AnyViewUsage_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewUsage()
    }
}
