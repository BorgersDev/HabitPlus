//
//  WebService.swift
//  HabitPlus
//
//  Created by Arthur Borges on 02/01/24.
//

import Foundation

enum WebService {
    
    enum Endpoint: String {
        case base = "https://habitplus-api.tiagoaguiar.co"
        
        case postUser = "/users"
    }
      
    private static func completeUrl(path: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else { return nil}
                return URLRequest(url: url)
    }
        
        static func postUser(fullName: String,
                             email: String,
                             password: String,
                             document: String,
                             phoneNumber: String,
                             birthDate: String,
                             gender: Int) {
            
            let json: [String: Any] = [
                "name": fullName,
                "email": email,
                "document": document,
                "phone": phoneNumber,
                "gender": gender,
                "birthday": birthDate,
                "password": password
            ]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
            guard var urlRequest = completeUrl(path: .postUser) else {return}
            
            urlRequest.httpMethod = "Post"
            urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else {
                    print (error)
                    return
                }
                print(String(data: data, encoding: .utf8))
                
                print("response\n")
                print(response)
                
                if let r = response as? HTTPURLResponse {
                    print(r.statusCode)
                }
            }
            
            task.resume()

    }
}
