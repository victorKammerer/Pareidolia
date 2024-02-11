//
//  MenuView.swift
//  Pareidolia
//
//  Created by Victor Kammerer on 10/02/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(imageName: "bg_menu")
                VStack {
                    Text("Pareidolia")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .padding(.bottom, 240)
                    
                    NavigationLink(destination: {
                        DrawView().navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("START")
                            .frame(width: 220, height: 64)
                            .background(Color.yellow)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    })
                    
                    NavigationLink(destination: {
                        CreditsView().navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("CREDITS")
                            .frame(width: 220, height: 64)
                            .background(Color.yellow)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    })
                }
            }
        }
    }
}
                                   
            
                            
                            

#Preview {
    MenuView()
}
