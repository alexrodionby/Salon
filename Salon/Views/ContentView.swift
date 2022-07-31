//
//  ContentView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 30.07.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndexOfTab = 0
    @State private var tabIcons = ["house", "questionmark.circle"]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedIndexOfTab {
                case 0:
                    ServicesView()
                case 1:
                    AboutView()
                default:
                    EmptyView()
                }
            }
            
            Divider()
                .padding(.bottom)
            
            HStack {
                ForEach(0..<2, id: \.self) { number in
                    Spacer()
                    Button {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedIndexOfTab = number
                        }
                    } label: {
                        Image(systemName: tabIcons[number])
                            .font(.title)
                            .foregroundColor(selectedIndexOfTab == number ? Color("brown6") : Color("brown3"))
                            .scaleEffect(selectedIndexOfTab == number ? 1.25 : 1.0)
                    }
                    Spacer()
                }
            }
            
        }
        .background(Color("brown1"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
