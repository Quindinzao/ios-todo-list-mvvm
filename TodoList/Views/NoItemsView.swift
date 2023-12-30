//
//  NoItemsView.swift
//  TodoList
//
//  Created by João Victor Fernandes on 29/12/23.
//

import SwiftUI

struct NoItemsView: View {

    @State var animate: Bool = false
    
    let white = Color("ImmutableWhiteColor")
    let primary = Color("PrimaryAccentColor")
    let accentColor = Color("AccentColor")
    let textColor = Color("DefaultContrastColor")

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                    .foregroundColor(textColor)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(animate ? primary : accentColor)
                            .cornerRadius(6)
                    })
                    .padding(.horizontal, animate ? 0 : 50)
                    .shadow(
                        color: animate ? Color(red: 0.0, green: 0.5, blue: 0.5).opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 6 : 12,
                        x: 0,
                        y: animate ? 10 : 20
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset (y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            return withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
    }
}
