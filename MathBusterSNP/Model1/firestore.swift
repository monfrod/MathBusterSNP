//
//  firestore.swift
//  MathBusterSNP
//
//  Created by yunus on 13.11.2024.
//

import FirebaseCore
import FirebaseFirestore
import UIKit



struct Storage {
    let db = Firestore.firestore()
    
    func fetchData() async -> [[String: Any]]{
        do {
            let doc = try await db.collection("users").getDocuments()
            var documentData: [[String: Any]] = []
            for document in doc.documents {
                documentData.append(document.data())
            }
            return documentData
        } catch{
            print(error)
            return []
        }
    }
}

