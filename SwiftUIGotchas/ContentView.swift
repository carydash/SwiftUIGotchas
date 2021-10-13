//
//  ContentView.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresenting: Bool = false

    var body: some View {
        NavigationView{
            List {
                NavigationLink("Order and Border") {
                    OrderAndBorder()
                }
                NavigationLink("View Versus State Changes") {
                    ViewVersusStateChanges()
                }
                NavigationLink("Text Alignment & Fixed Size") {
                    TextAlignmentAndFixedSize()
                }
                NavigationLink("AnyView Usage") {
                    AnyViewUsage()
                }
                NavigationLink("Navigation Leak") {
                    NavigationLeak()
                }
                NavigationLink("Observed Objects") {
                    ObservedObjects()
                }
                NavigationLink("Data Passing") {
                    DataPassing()
                }
            }
            .navigationTitle("SwiftUI Gotchas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
