//
//  AuthService.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 19.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    public static let shared = AuthService()
    private init() {}
    
    public func registerUser(with userRequest: UserRegisterRequest, completion: @escaping(Bool, Error?)->Void) {
        let username = userRequest.username
        let password = userRequest.password
        let email = userRequest.email
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil )
                }
            
        }
    }
    
    public func signIn(with userRequest: UserLoginRequest, completion: @escaping(Error?)->Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil )
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        }
        catch let error {
            completion(error)
        }
    }
    
}
