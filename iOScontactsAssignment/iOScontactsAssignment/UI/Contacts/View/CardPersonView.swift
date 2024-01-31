//
//  CardPersonView.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

struct CardPersonView: View {
    var number: Int
    var name: String
    var namePhoto: String?
    var body: some View {
        ZStack {
            HStack {
                if number == 1 {
                    Image("image")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                } else {
                    ZStack {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 60, height: 60)
                        
                        Text(namePhoto ?? "AT")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                    .frame(width: 10)
                Text(name)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 22)
                            .foregroundColor(.gray)
            }
            .padding(.all, AppConstants.ContactsScreen.horizontalPadding)
        }
        .background(.white)
    }
}

#Preview {
    CardPersonView(number: 0, name: "Senila Constantin")
}
