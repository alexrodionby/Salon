//
//  SpecialistView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 5.08.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SpecialistView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "brown1")
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(named: "brown6")!]
    }
    
    @ObservedObject var serviceCategoryModel = ServiceCategoryModel()
    @State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 0) {
                    ForEach(serviceCategoryModel.specialistData) { spec in
                        
                        ZStack {
                            VStack {
                                WebImage(url: URL(string: spec.specialistPhotoURL))
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                                    .padding(10)
                                Text("\(spec.specialistName)")
                                    .font(.title2)
                                    .foregroundColor(Color("brown6"))
                                Text("\(spec.specialistDescription)")
                                    .font(.title3)
                                    .foregroundColor(Color("brown4"))
                            }
                        }
                        .navigationTitle("Специалисты")
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                }
            }
            .background(Color("brown1"))
        }
        .onAppear {
            serviceCategoryModel.getAllSpecialist()
        }
    }
}

struct SpecialistView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistView()
    }
}
