//
//  NavigationLeak.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/10/21.
//

import SwiftUI

/// Source - https://stackoverflow.com/a/61234030/11938270
/// Question: When/how do swiftui views (image) get deallocated?
struct NavigationLeak: View {
    var body: some View {
        List {
            IndividualNavigationLink()
//            SingularNavigationLink()
        }
    }

}

struct IndividualNavigationLink: View {
    var body: some View {
        Section(header: Text("Individual NavigationLinks")) {
            NavigationLink("Doge") {
                NamedImageView(imageName: "dogeMeme")
            }
            NavigationLink("Mars") {
                NamedImageView(imageName: "marsSurface")
            }
            NavigationLink("Mars 2") {
                LazyView(NamedImageView(imageName: "marsSurface"))
            }
        }
    }
}

struct SingularNavigationLink: View {
    enum NavType {
        case doge, mars1, mars2
    }
    @State private var navType: NavType = .doge
    @State private var isActive: Bool = false

    var body: some View {
        Section(header: Text("Singular NavigationLink")) {
            Button {
                setType(.doge)
            } label: {
                Text("Doge")
            }
            Button {
                setType(.mars1)
            } label: {
                Text("Mars1")
            }
            Button {
                setType(.mars2)
            } label: {
                Text("Mars2")
            }
        }.frame(width: 300)
        .background(
            NavigationLink(destination: LazyView(navigate(to: navType)),
                           isActive: $isActive,
                           label: { EmptyView() })
                .hidden()
                .accessibilityHidden(true)
        )
        .navigationTitle("Navigation Leak")
    }

    func setType(_ navType: NavType) {
        self.navType = navType
        self.isActive = true
    }

    @ViewBuilder func navigate(to navType: NavType) -> some View {
        switch navType {
        case .doge:
            NamedImageView(imageName: "dogeMeme")
        case .mars1:
            NamedImageView(imageName: "marsSurface")
        case .mars2:
            LazyView(NamedImageView(imageName: "marsSurface"))
        }
    }
}

struct NamedImageView: View {
    let imageName: String
    let deallocPrinter: DeallocPrinter

    init(imageName: String) {
        self.imageName = imageName
        self.deallocPrinter = DeallocPrinter(imageName)
    }

    var body: some View {
        Image(imageName)
    }
}

class DeallocPrinter {
    let label: String
    let id = UUID()
    init(_ label: String) {
        self.label = label
        print("init: \(label), ID: \(id)")
    }
    deinit { print("deinit: \(label), ID: \(id)") }
}

struct NavigationLeak_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationLeak()
        }
    }
}
