//
//  ObservedObjects.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/10/21.
//

import SwiftUI

/// Source - https://stackoverflow.com/a/63698520/11938270

/// Try using `externalState` below to be passed into `ObservedObjectView`
//var externalState = ObservedDataModel(type: .observedObject)
struct ObservedObjects: View {
    @State private var count = 0
//    @StateObject var observedState = ObservedDataModel(type: .stateObject)

    var body: some View {
        List {
            VStack {
                Text("Parent View").font(.headline)
                HStack {
                    Text("Refresh Count: \(count)")
                    Spacer()
                    Button("Refresh") { count += 1 }
                }
            }

            Section(header: Text("Child Views")) {
                StateObjectView()
                ObservedObjectView()
//                EnvObjectView()
//                    .environmentObject(observedState)
            }
        }
        .border(.gray, width: 2)
        .padding(4)
        .navigationTitle("Observed Objects")
    }
}

// MARK: - DataModel
class ObservedDataModel: ObservableObject {
    enum ObserverType: String {
        case stateObject, observedObject
    }

    @Published var count = 0

    let type: ObserverType
    let id = UUID()

    init(type: ObserverType) {
        self.type = type
        print("init \(type.rawValue),  ID: \(id)")
    }

    deinit {
        print("denit \(type.rawValue),  ID: \(id)")
    }
}

// MARK: - CounterView
struct CounterView: View {
    let text: String
    let buttonAction: () -> Void
    let borderColor: Color

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Button("Add") { buttonAction() }
        }
        .padding()
        .border(borderColor, width: 2)
    }
}

// MARK: - ChildViews
struct StateObjectView: View {
    @StateObject var state = ObservedDataModel(type: .stateObject)

    var body: some View {
        CounterView(text: "@StateObject Count: \(state.count)",
                    buttonAction: { state.count += 1 },
                    borderColor: .blue)
    }
}

struct ObservedObjectView: View {
    @ObservedObject var state = ObservedDataModel(type: .observedObject)
//    @ObservedObject var state: ObservedDataModel

    var body: some View {
        CounterView(text: "@ObservedObject Count: \(state.count)",
                    buttonAction: { state.count += 1 },
                    borderColor: .green)
    }
}

struct EnvObjectView: View {
    @EnvironmentObject var state: ObservedDataModel

    var body: some View {
        CounterView(text: "@EnvironmentObject Count: \(state.count)",
                    buttonAction: { state.count += 1 },
                    borderColor: .red)
    }
}







struct ObservedObjects_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjects()
    }
}
