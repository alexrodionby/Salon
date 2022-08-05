//
//  ServicesView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 30.07.22.
//

import SwiftUI
import Firebase

struct ServicesView: View {
    
    @ObservedObject var serviceCategoryModel = ServiceCategoryModel()
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "brown1")
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(named: "brown6")!]
        serviceCategoryModel.getServiceCategory()
    }
    
    @State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Image("logoblack")
                    .resizable()
                    .scaledToFit()
                    .padding()
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 0) {
                    ForEach(serviceCategoryModel.serviceCategoryData) { index in
                        NavigationLink(destination: ServiceDetailView(subServiceName: index.serviceSubCategoryName, subID: index.id, mainCategoryName: index.serviceCategoryName)) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color("brown4"))
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                    .padding()
                                
                                
                                Text("\(index.serviceCategoryName)")
                                    .lineLimit(5)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .font(.body)
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                            }
                            .navigationTitle("Наши услуги")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
            .background(Color("brown1"))
        }
        .accentColor(Color("brown6"))
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
