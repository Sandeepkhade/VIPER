//
//  NetworkManager.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation

final class NetworkManager: NSObject {
    
    static let networkManagerShared = NetworkManager()
    private override init() { }
    
    let url = URL(string: "https://api.github.com/users/Sandeepkhade/following?")
    
    //Fetch Follower from URL
    func fetchFollowerData(completion: @escaping ([Followers]) -> ()) {
        URLSession.shared.request(url: url, expecting: [Followers].self
        ) { result in
            switch result {
            case .success(let followers):
                DispatchQueue.main.async {
                    completion(followers)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //Fetch FollowerDetail from URL
    func fetchUserData(url: String, completion: @escaping(FollowerDetail) -> ()) {
        let urlIn = URL(string: url)
        URLSession.shared.request(url: urlIn, expecting: FollowerDetail.self
        ) { result in
            switch result {
            case .success(let followers):
                DispatchQueue.main.async {
                    completion(followers)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//Generic Session handler 
extension URLSession {
    
    func request <T: Codable>(url: URL?,expecting: T.Type,completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        let task = self.dataTask(with: url) { data, _, error in
            guard let data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
