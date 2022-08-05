//
//  StorageModel.swift
//  Salon
//
//  Created by Alexandr Rodionov on 4.08.22.
//

import Foundation
import FirebaseStorage

class StorageModel: ObservableObject {
    
    func getSalonAllPhotoPathAsync() async throws -> [String] {
        let storage = Storage.storage()
        let storageReference = storage.reference().child("/salon")
        do {
            let result = try await storageReference.listAll()
            let tempPath = result.items.map { $0.fullPath }
            return tempPath
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func getSalonAllPhotoURLAsync() async throws -> [URL] {
        let storage = Storage.storage()
        let storageReference = storage.reference().child("/salon")
        var urls: [URL] = []
        do {
            let result = try await storageReference.listAll()
            let tempPath = result.items.map { $0.fullPath }
            let newStorage = tempPath.map { storage.reference().child("\($0)") }
            for item in newStorage {
                let newURL = try await item.downloadURL()
                urls.append(newURL)
            }
            return urls
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    
    
}
