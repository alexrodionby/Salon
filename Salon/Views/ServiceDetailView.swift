//
//  ServiceDetailView.swift
//  Salon
//
//  Created by Alexandr Rodionov on 31.07.22.
//

import SwiftUI

struct ServiceDetailView: View {
    
    let subServiceName: String
    let subID: String
    let mainCategoryName: String
    
    @ObservedObject var serviceCategoryModel = ServiceCategoryModel()
    
    @State var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center) {
                ForEach(serviceCategoryModel.serviceData) { index in
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("brown4"))
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .padding()
                        
                        HStack {
                            Text("\(index.serviceName)")
                                .font(.body)
                                .foregroundColor(Color.white)
                                .padding()
                            Spacer()
                            VStack {
                            Text("\(index.serviceTime) мин")
                                .foregroundColor(Color.white)
                                .padding()
                            Text("\(index.servicePrice) руб")
                                .foregroundColor(Color.white)
                                .padding()
                                Link("Заказать", destination: URL(string: "https://dikidi.net/684321")!)
                                    .foregroundColor(Color("gold"))
                                    .font(.title2)
                                    .padding()
                            }
                        }
                        .padding()
                        .navigationTitle(mainCategoryName)
                    }
                }
            }
        }
        .background(Color("brown1"))
        
        .onAppear {
            serviceCategoryModel.getSubService(subServiceName: subServiceName, subID: subID)
        }
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(subServiceName: "eyebrows", subID: "hEdUCNNBsLQNkKsV3FIT", mainCategoryName: "Брови")
    }
}
