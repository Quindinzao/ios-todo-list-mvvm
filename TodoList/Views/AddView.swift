//
//  AddView.swift
//  TodoList
//
//  Created by João Victor Fernandes on 27/12/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    let accent = Color("AccentColor")
    let backgroundInput = Color("BackgroundInputColor")
    let defaultColor = Color("DefaultColor")
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type the title here...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 50)
                .background(backgroundInput)
                .cornerRadius(6)
                
                Button (action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(defaultColor)
                        .fontWeight(.bold)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(accent)
                        .cornerRadius(6)
                        .alert(isPresented: $showAlert, content: getAlert)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item ✏️")
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😕"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(ListViewModel())
}
