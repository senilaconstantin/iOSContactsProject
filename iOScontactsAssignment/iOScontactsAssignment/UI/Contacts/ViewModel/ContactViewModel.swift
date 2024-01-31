//
//  ContactViewModel.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

class ContactViewModel: ObservableObject {
    @Published var listContact: [UserModel] = [UserModel]()
    
    init() {
        loadingContacts()
    }
    func loadingContacts() {
        APIClient.shared.getContactsData(responseC: { data in
            DispatchQueue.main.async {
                if let contacts = data {
                    contacts.forEach { contact in
                        if self.isActive(status: contact.status ?? "") {
                            self.listContact.append(contact)
                        }
                    }
                } else {
                    print("There are no contacts")
                }
            }
        })
    }
    func isActive(status: String) -> Bool {
        return status == "active"
    }
    
    func getNamePhoto(name: String) -> String {
        let names = name.components(separatedBy: " ")
        guard names.count >= 2, let firstLetter = names[0].first, let secondLetter = names[1].first else {
            return ""
        }
        
        return String(firstLetter) + String(secondLetter)
    }
}
