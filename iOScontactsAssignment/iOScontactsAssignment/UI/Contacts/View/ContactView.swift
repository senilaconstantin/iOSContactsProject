//
//  ContactView.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

struct ContactView: View {
    @StateObject var contactVM: ContactViewModel = .init()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Contacte")
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "person.fill.badge.plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                    }
                    .padding(.all, 8)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding([.leading, .trailing], AppConstants.ContactsScreen.horizontalPadding)
                
                ZStack{
                    Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        HStack{
                            Text("CONTACTELE MELE")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.gray)
                                .baselineOffset(-10)
                            Spacer()
                        }
                        .padding([.leading, .trailing], AppConstants.ContactsScreen.horizontalPadding)
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 1) {
                                ForEach(contactVM.listContact.indices, id: \.self) { index in
                                    CardPersonView(number: (contactVM.listContact[index].id ?? 0) % 2, name: contactVM.listContact[index].name ?? "", namePhoto: contactVM.getNamePhoto(name: contactVM.listContact[index].name ?? ""))
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
