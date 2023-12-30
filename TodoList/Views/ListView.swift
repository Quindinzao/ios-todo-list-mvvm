//
//  ListView.swift
//  TodoList
//
//  Created by João Victor Fernandes on 24/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    let accent = Color("AccentColor")
    let defaultColor = Color("DefaultContrastColor")
    let disabled = Color("DisabledColor")

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📋")
        .navigationBarItems(

            leading: EditButton()
            .disabled(listViewModel.items.isEmpty)
            .foregroundColor(
                listViewModel.items.isEmpty ?
                Color(disabled) :
                Color(accent)
            ),

            trailing: NavigationLink("+", destination: AddView())
                .font(.system(size: 24))

        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
