//
//  AddContactView.swift
//  iOScontactsAssignment
//
//  Created by Constantin Senila on 31.01.2024.
//

import SwiftUI

struct AddContactView: View {
    @State var nume: String = ""
    @State var prenume: String = ""
    @State var telefon: String = ""
    @State var email: String = ""
    @EnvironmentObject var contactVM: ContactViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Adaugă contact")
                    .font(.system(size: 30, weight: .bold))
                    .padding([.leading, .trailing], 10)
                    .baselineOffset(10)
                Spacer()
            }
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 10)
                    AppTextField(textHeader: "NUME", text: $nume)
                    
                    Spacer()
                        .frame(height: 20)
                    AppTextField(textHeader: "PRENUME", text: $prenume)
                    
                    Spacer()
                        .frame(height: 20)
                    AppTextField(textHeader: "TELEFON", text: $telefon)
                    
                    Spacer()
                        .frame(height: 20)
                    AppTextField(textHeader: "EMAIL", text: $email)
                    
                    Spacer()
                    
                    Button(action: {
                        contactVM.addContact(nume: nume, prenume: prenume, telefon: telefon, email: email)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack{
                            Spacer()
                            Text("Salvează")
                                .foregroundColor(.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    Spacer()
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                }
                .padding([.leading, .trailing], 16)
            }
            .background(.gray.opacity(0.3))
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddContactView()
        .environmentObject(ContactViewModel())
}
