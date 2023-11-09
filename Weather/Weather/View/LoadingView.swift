//
//  LoadingView.swift
//  Weather
//
//  Created by Taejun Ha on 11/6/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .colorMultiply(.black)
                .padding(.bottom, 80)
        }
    }
}


#Preview {
    LoadingView()
}
