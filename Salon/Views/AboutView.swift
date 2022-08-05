//
//  AboutView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 30.07.22.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct AboutView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "brown1")
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(named: "brown6")!]
    }
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("brown1")
                        .ignoresSafeArea()
                    ScrollView {
                        VStack {
                            Image("logoblack")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            Text("ул. Ленина д.12А каб. №3")
                                .font(.title3)
                            
                            Image("map1")
                                .resizable()
                                .scaledToFit()
                                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .padding()
                            
                            HStack {
                                NavigationLink(destination: SalonPhotoView()) {
                                    HStack {
                                        Text("Фотографии салона")
                                            .foregroundColor(Color("brown6"))
                                            .font(.title2)
                                        Spacer()
                                        Image(systemName: "chevron.right.2")
                                            .foregroundColor(Color("brown6"))
                                    }
                                }
                                .padding(.horizontal)
                                
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                NavigationLink(destination: SpecialistView()) {
                                    HStack {
                                        Text("Наши специалисты")
                                            .foregroundColor(Color("brown6"))
                                            .font(.title2)
                                        Spacer()
                                        Image(systemName: "chevron.right.2")
                                            .foregroundColor(Color("brown6"))
                                    }
                                }
                                .padding(.horizontal)                                
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("О салоне")
                .navigationBarTitleDisplayMode(.inline)
            }
            .accentColor(Color("brown6"))
        }
    }
    
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
