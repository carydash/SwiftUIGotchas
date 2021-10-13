//
//  ViewVersusStateChanges.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/11/21.
//

import SwiftUI

/// Source - https://developer.apple.com/videos/play/wwdc2021/10022/
struct ViewVersusStateChanges: View {
    @State private var viewChangeFlag = true
    @State private var branchChangeFlag = true

    var body: some View {
        List {
            Section(header: Text("Branch Change - recreates view dependencies")) {
                VStack {
                    if branchChangeFlag {
                        SimpleCookieView()
                        Spacer()
                    } else {
                        Spacer()
                        SimpleCookieView()
                    }
                }
                .frame(height: 200)

                Toggle("", isOn: $branchChangeFlag)
            }

            Section(header: Text("View Change - redraws view while keeping dependencies")) {
                VStack {
                    SimpleCookieView()
                        .frame(maxHeight: .infinity,
                               alignment: viewChangeFlag ? .top : .bottom)
                }
                .frame(height: 200)

                Toggle("", isOn: $viewChangeFlag)
            }

        }
        .navigationTitle("View vs. State Changes")
        .animation(.default)
    }
}

class CookieModel: ObservableObject {
    init() { print("CookieModel init") }

    deinit { print("CookieModel deinit") }
}

struct SimpleCookieView: View {
    @StateObject var cookieModel = CookieModel()

    var body: some View {
        Text("🍪").font(.largeTitle)
    }
}

/// Optional - different ways of hiding views
extension View {
    /// creates different views using branches
    @ViewBuilder func hideUsingBranch(_ shouldHide: Bool) -> some View {
        if shouldHide {
            EmptyView()
        } else {
            self
        }
    }
    /// hides a view by making it transparent vs. opaque
    func hideUsingOpacity(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
    /// hides a view by modifying its frame height, giving the illusion that it's not in the view hierarchy
    func hideUsingFrame(_ shouldHide: Bool) -> some View {
        frame(height: shouldHide ? 0 : nil)
    }
}



struct ViewVersusStateChanges_Previews: PreviewProvider {
    static var previews: some View {
        ViewVersusStateChanges()
    }
}
