//
//  ClearButton.swift
//  SearchMovie
//
//  Created by Bruno Gomez on 3/9/22.
//

import SwiftUI

public struct ClearButton: ViewModifier {
    @Binding var text: String
    @Binding var visible: Bool

    public init(text: Binding<String>, visible: Binding<Bool>) {
        self._text = text
        self._visible = visible
    }

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" } // onTapGesture or plainStyle button
        }
    }
}
