//
//  DataPassing.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/10/21.
//

import SwiftUI

struct DataPassing: View {
    @State var count: Int = 0

    var body: some View {
        List {
            Section(header: Text("Using @Binding Property Wrapper")) {
                BindingView_PropertyWrapper(value: $count)
            }
            .frame(maxWidth: .infinity)

//            Section(header: Text("Passing Binding and Non-Binding Values")) {
//                BindingView($count, count)
//            }
//            .frame(maxWidth: .infinity)

//            Button {
//                count += 1
//            } label: {
//                Text("Parent View Add")
//            }
        }
        .navigationTitle("Data Passing")
    }
}

struct BindingView_PropertyWrapper: View {
    @Binding var value: Int

    var body: some View {
        VStack {
            Text("Property Wrapper Value: \(value)")
            Button {
                value += 1
            } label: {
                Text("Child View Add")
            }
        }
    }
}

struct BindingView: View {
    var value: Binding<Int>
    var nonBindingValue: Int

    init(_ val: Binding<Int>, _ nonBinding: Int) {
        self.value = val
        self.nonBindingValue = nonBinding
    }

    var body: some View {
        VStack {
            Text("Var Declaration: \(value.wrappedValue)")
            Text("Non Binding: \(nonBindingValue)")
            Button {
                value.wrappedValue += 1
            } label: {
                Text("Add")
            }
        }
    }
}

class DataPassingModel: ObservableObject {
    @Published var count = 0
}

/// Discuss PreferenceKeys if we have time

struct DataPassing_Previews: PreviewProvider {
    static var previews: some View {
        DataPassing()
    }
}
