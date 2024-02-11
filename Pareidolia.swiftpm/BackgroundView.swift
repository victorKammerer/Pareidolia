//
//  BackgroundView.swift
//  Pareidolia
//
//  Created by Victor Kammerer on 10/02/24.
//

import SwiftUI

struct BackgroundView: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .ignoresSafeArea(.all, edges: .all)
        
    }
}
