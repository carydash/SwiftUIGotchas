//
//  OrderAndBorder.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/11/21.
//

import SwiftUI

struct OrderAndBorder: View {
    let boxSize: CGFloat = 100

    var body: some View {
        List {

            let shape = RoundedRectangle(cornerRadius: 16)

            Section(header: Text("Order Matters")) {
                VStack {
                    Text("Background then Padding")
                    shape
                        .background(Color.blue)
                        .padding()
                        .frame(width: boxSize, height: boxSize)

                    Text("Padding then Background")
                    shape
                        .padding()
                        .background(Color.blue)
                        .frame(width: boxSize, height: boxSize)
                }
            }.frame(maxWidth: .infinity)

            Section(header: Text("Stroke vs. Stroke Border")) {
                VStack {
                    Text("Stroke centers on edge of shape")
                    shape
                        .stroke(Color.blue, lineWidth: 10)
                        .frame(width: boxSize, height: boxSize)

                    Text("StrokeBorder draws inside shape")
                    shape
                        .strokeBorder(lineWidth: 10)
                        .frame(width: boxSize, height: boxSize)
                }
            }.frame(maxWidth: .infinity)

        }.navigationTitle("Order and Border")
    }
}

struct OrderAndBorder_Previews: PreviewProvider {
    static var previews: some View {
        OrderAndBorder()
    }
}
