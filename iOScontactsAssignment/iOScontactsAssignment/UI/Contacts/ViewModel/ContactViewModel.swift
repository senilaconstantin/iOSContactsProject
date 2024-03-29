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
    func getParityId(index: Int) -> Int {
        return (self.listContact[index].id ?? 0) % 2
    }
    func getName(index: Int) -> String {
        return self.listContact[index].name ?? ""
    }
    func getEmail(index: Int) -> String {
        return self.listContact[index].email ?? ""
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
    
    func addContact(nume: String, prenume: String, telefon: String, email: String) {
        let contact: UserModel = UserModel.init(id: Int.random(in: 1000000..<9999999), name: nume + " " + prenume, email: email, gender: telefon, status: "active")
        listContact.append(contact)
    }
}
