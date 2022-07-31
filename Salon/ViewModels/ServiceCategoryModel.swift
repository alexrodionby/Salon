//
//  ServiceCategoryModel.swift
//  Salon
//
//  Created by Alexandr Rodionov on 31.07.22.
//

import Foundation
import Firebase

class ServiceCategoryModel: ObservableObject {
    
    @Published var serviceCategoryData: [ServiceCategory] = []
    @Published var serviceData: [Service] = []
    
    func addServiceCategory(name: String, categoryID: Int) {
        let db = Firestore.firestore()
        db.collection("ServiceCategory").addDocument(data: ["serviceCategoryName": name, "serviceCategoryID": categoryID]) { error in
            if error == nil {
                self.getServiceCategory()
            } else {
                print(error?.localizedDescription ?? "Some error")
            }
        }
    }
    
    func deleteServiceCategory(serviceToDelete: ServiceCategory) {
        let db = Firestore.firestore()
        db.collection("ServiceCategory").document(serviceToDelete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.serviceCategoryData.removeAll { category in
                        return category.id == serviceToDelete.id
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Some error")
            }
        }
    }
    
    // Надо доработать эту функцию
    func updateServiceCategory(serviceToUpdate: ServiceCategory) {
        let db = Firestore.firestore()
        db.collection("ServiceCategory").document(serviceToUpdate.id).setData(["serviceCategoryName": "new name"], merge: true) { error in
            if error == nil {
                self.getServiceCategory()
            } else {
                print(error?.localizedDescription ?? "Some error")
            }
        }
    }
    
    func getSubService(subServiceName: String, subID: String) {
        let db = Firestore.firestore()
        db.collection("ServiceCategory").document(subID).collection(subServiceName).getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.serviceData = snapshot.documents.map { doc in
                            return Service(id: doc.documentID,
                                           serviceName: doc["serviceName"] as? String ?? "",
                                           serviceTime: doc["serviceTime"] as? Int ?? 0,
                                           servicePrice: doc["servicePrice"] as? Int ?? 0)
                        }
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Some error")
            }
        }
    }
    
    func getServiceCategory() {
        let db = Firestore.firestore()
        db.collection("ServiceCategory").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.serviceCategoryData = snapshot.documents.map { doc in
                            return ServiceCategory(id: doc.documentID,
                                                   serviceCategoryName: doc["serviceCategoryName"] as? String ?? "",
                                                   serviceSubCategoryName: doc["serviceSubCategoryName"] as? String ?? "")
                        }
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Some error")
            }
        }
    }
}
