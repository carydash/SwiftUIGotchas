//
//  LazyView.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/10/21.
//

import SwiftUI

// https://stackoverflow.com/a/61234030/11938270
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct LazyView_Previews: PreviewProvider {
    static var previews: some View {
        LazyView(Text("Hi"))
    }
}
