//
//  SplashScreen.swift
//  HackerNews
//
//  Created by Devasurya on 06/03/24.
//

import SwiftUI

struct SplashScreen: View {
    
    /// Variable Decalarations
    @State private var isActive: Bool = false
    @State private var showView: Bool = false
    @State private var rotationAngle: Double = 0
    @State private var size: Double = 0.6
    @State private var opacityValue : Double = 0.6
    var body: some View {
        if isActive {
            ListView()
        } else {
            VStack{
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 200,height: 200)
                        .scaledToFit()
                        .clipShape(Circle())
                        .rotationEffect(Angle(degrees: rotationAngle))
                    Text("H4ckerNewS.")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.black)
                        .opacity(0.8)
                        .bold()
                }
                .scaleEffect(size)
                .opacity(opacityValue)
                .onAppear{
                    showView.toggle()
                    withAnimation(.easeInOut(duration: 1.2)){
                        self.rotationAngle += 360
                        self.size = 0.8
                        self.opacityValue = 0.9
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    isActive.toggle()
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
