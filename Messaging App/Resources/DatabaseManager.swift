//
//  DatabaseManager.swift
//  Messaging App
//
//  Created by IACD-024 on 2022/08/25.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    
}

// MARK: - Acount Management

extension DatabaseManager {
    public func userExists(with email: String, completion: @escaping((Bool)-> Void)){ //check if the email doesnt exists yet
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
           
            guard snapshot.value as? String != nil else {
               completion(false)
                return
            }
            completion(true)
        })
        
    }
    //insert new use to database
    
    public func insertUser(with user: MessageAppUser){ // to make sure that a person with the same email and last name won't be able to register again
        database.child(user.safeEmail).setValue([
            "first_Name": user.firstName,
            "last_Name": user.lastName
        ])
    }
}
struct MessageAppUser{
    
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    //let profilePictureUrl: String
}







