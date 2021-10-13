//
//  TextAlignmentAndFixedSize.swift
//  SwiftUIGotchas
//
//  Created by Cary Zhou on 10/11/21.
//

import SwiftUI

/// https://stackoverflow.com/q/64689792/11938270
/// https://developer.apple.com/documentation/swiftui/view/fixedsize(horizontal:vertical:)
struct Constants {
    static let messages = [
        "Text so long that it could reach all the way to the other side of the screen, we only want it to take up a width of about 75% of the screen though starting from the left. That is the main issue of this post.",
        "Yeah. This message is also long enough to take up the full width of the screen, but for this one we want it to take up 75% of the screen starting all the way on the right side.",
        "What are we gonna do.",
    ]
}

/// 1. Zoltan suggested customizing `.listRowInsets`
/// 2. We want to use `multilineTextAlignment` instead of `frame(alignment)` for `Text`
/// 3. `fixedSize()` should be used carefully, we can adjust padding to make it look acceptable
struct TextAlignmentAndFixedSize: View {
    var body: some View {
        List {
            textViews
//                .listRowInsets(EdgeInsets())
        }
        .navigationTitle("TextAlignment & fixedSize")
    }

    var textViews: some View {
        ForEach(0..<Constants.messages.count, id: \.self) { number in
            Text(Constants.messages[number])
//                .frame(maxWidth: .infinity,
//                       alignment: number.isEven ? .leading : .trailing)
//                .multilineTextAlignment(number.isEven ? .leading : .trailing)
//                .lineLimit(nil)
//                .fixedSize(horizontal: false, vertical: true)
//                .overlay(rectangularBorder)

//                .padding(.vertical, 10)
//                .minimumScaleFactor(0.9)
//                .font(.system(size: 17))
            // Zoltan - Edge insets on list
        }
    }
    var rectangularBorder: some View {
        Rectangle()
            .strokeBorder(lineWidth: 1)
            .foregroundColor(.blue)
    }
}

extension Int {
    /// sup - https://www.npmjs.com/package/is-even
    var isEven: Bool { self % 2 == 0}
}

struct TextAlignmentAndFixedSize_Previews: PreviewProvider {
    static var previews: some View {
        TextAlignmentAndFixedSize()
    }
}
