//
//  AppTextField.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

struct AppTextField: View {
    var textHeader: String
    @Binding var text: String
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text(textHeader)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .padding([.top], 15)
                TextField("", text: $text)
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                Divider()
                    .background(Color.gray)
                    .padding([.top], 10)
                    .padding([.bottom], 15)
            }
            .padding([.leading, .trailing], 20)
        }
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    AppTextField(textHeader: "Name", text: .constant(""))
}
