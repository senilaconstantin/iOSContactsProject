//
//  UserModel.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

public class UserModel: Codable, ObservableObject {
    public var id: Int?
    public var name: String?
    public var email: String?
    public var gender: String?
    public var status: String?
    
    public init(id: Int?, name: String?, email: String?, gender: String?, status: String?) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status
    }
}
