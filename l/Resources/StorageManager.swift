//
//  StorageManager.swift
//  l
//
//  Created by user217575 on 4/26/22.
//
import FirebaseStorage
import Foundation
public class StorageManager{
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum StorageManagerError: Error{
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void ){
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void){
        bucket.child(reference).downloadURL(completion: {url, error in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
            
        })
    }
        
    }
