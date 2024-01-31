//
//  SelectedContactView.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

struct SelectedContactView: View {
    @EnvironmentObject var contactVM: ContactViewModel
    var index: Int
    
    var body: some View {
        VStack {
            if (contactVM.listContact[index].id ?? 0) % 2 == 1 {
                Image("image")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .clipShape(Circle())
                    .frame(width: 125, height: 125)
            } else {
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 125, height: 125)
                    
                    Text(contactVM.getNamePhoto(name: contactVM.getName(index: index)))
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            Spacer()
                .frame(height: 30)
            Text(contactVM.listContact[index].name ?? "")
                .font(.system(size: 30, weight: .bold))
            Spacer()
                .frame(height: 30)
            HStack{
                VStack(alignment: .leading) {
                    Text("email")
                        .font(.system(size: 12))
                    Spacer()
                        .frame(height: 5)
                    Text(contactVM.getEmail(index: index))
                        .font(.system(size: 17))
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .background(.gray.opacity(0.5))
            .cornerRadius(8)
            
            Spacer()
        }
        .padding([.leading, .trailing], AppConstants.ContactsScreen.horizontalPadding)
    }
}

//#Preview {
//    SelectedContactView()
//}
