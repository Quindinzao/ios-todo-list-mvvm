//
//  ListRowView.swift
//  TodoList
//
//  Created by João Victor Fernandes on 27/12/23.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel
    
    let primary = Color("PrimaryAccentColor")
    let yellow = Color("WarningColor")

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? primary : yellow)
                .fontWeight(.bold)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second item!", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
