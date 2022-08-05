//
//  SalonPhotoView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 5.08.22.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct SalonPhotoView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "brown1")
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(named: "brown6")!]
    }
    
    @ObservedObject var storageModel = StorageModel()
    @State var allPhotosURL: [URL] = []
    @State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 0) {
                    ForEach(allPhotosURL, id: \.self) { fotoURL in
                        
                        ZStack {
                            WebImage(url: fotoURL)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                .padding(10)
                        }
                        .navigationTitle("Фотографии салона")
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                }
            }
            .background(Color("brown1"))
        }
        .onAppear {
            Task {
                allPhotosURL = try await storageModel.getSalonAllPhotoURLAsync()
            }
        }
    }
}


struct SalonPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        SalonPhotoView()
    }
}
