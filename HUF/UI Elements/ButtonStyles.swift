//
//  ButtonStyles.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60)
            .foregroundColor(.white)
            .background(configuration.isPressed ?
                        Color.gray : Color.black)
            .cornerRadius(32)
    }
}

public struct SecondaryButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title2)
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60)
            .background(configuration.isPressed ?
                        Color.gray : Color.white)
            .cornerRadius(32)
            .overlay{
                RoundedRectangle(cornerRadius: 32)
                    .stroke(Color.black, lineWidth: 4)
                    .frame(width: 264)
            }
    }
}
