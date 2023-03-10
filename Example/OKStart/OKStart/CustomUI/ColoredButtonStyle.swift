//
//  ColoredButtonStyle.swift
//  OKStart
//
//  Created by mituser on 02/03/23.
//

import SwiftUI

struct ColoredButtonStyle: ButtonStyle {
    var backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: 150
               , maxHeight: 30)
            .border(backgroundColor)
            .buttonStyle(.borderless)
            .background(backgroundColor)
            .cornerRadius(28)
            .font(.system(size: 22, weight: .medium))
            .foregroundColor(Color.init(.white))
    }
}
