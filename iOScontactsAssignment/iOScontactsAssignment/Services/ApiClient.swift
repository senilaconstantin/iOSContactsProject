//
//  ApiClient.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI
import Alamofire

class APIClient {
    static var shared = APIClient()
    
    func getContacts(responseC: @escaping (_ data: Data?) -> Void) {
        let urlString = "https://gorest.co.in/public/v2/users"
        guard let url = URL(string: urlString) else {
            print("--- Url found nil")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                responseC(nil)
                print("Response Error getDashboardCards!")
                return
            }
            responseC(data)
        }
        .resume()
    }
    
    func getContactsData(responseC: @escaping (_ data: [UserModel]?) -> Void) {
        getContacts() {data in
            if let dataR = data {
                guard let result = try? JSONDecoder().decode([UserModel].self, from: dataR) else {
                    responseC(nil)
                    return
                }
                responseC(result)
            } else {
                responseC(nil)
            }
        }
    }
}
