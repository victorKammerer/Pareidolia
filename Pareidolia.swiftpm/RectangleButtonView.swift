//
//  RectangleButtonView.swift
//  Pareidolia
//
//  Created by Wilma Ferreira on 10/02/24.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Text(buttonText)
            .frame(width: 220, height: 64)
            .background(Color.yellow)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .onTapGesture {
                NavigationLink(
                    destination: {
                        
                    }, label: {
                        Text("START")
                            .padding(EdgeInsets(top: 20, leading: 32, bottom: 20, trailing: 32))
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .semibold, design: .default))
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .foregroundColor(Color("pink-200"))
                            )
                    }
                )
            }
    }
}

#Preview {
    RectangleButtonView(buttonText: "START", action: {})
}
