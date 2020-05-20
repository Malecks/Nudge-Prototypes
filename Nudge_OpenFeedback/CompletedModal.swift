//
//  CompletedModal.swift
//  Nudge_OpenFeedback
//
//  Created by Alex Mathers on 2020-05-19.
//  Copyright © 2020 Malecks. All rights reserved.
//

import SwiftUI

struct CompletedModal: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Header()
                ZStack {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .stroke(Color(white: 0.9), lineWidth: 1)
                        .frame(height: 60)
                    Text("Strongly Agree")
                        .fontWeight(.semibold)
                }
                .padding()
                
                Color(white: 0.9)
                    .frame(height: 1)
                    .padding(.horizontal)
                
                Text("Thanks for participating in our Survey! Feedback like yours helps us shape the future of our content and company culture.")
                .padding()
                
                Color(white: 0.9)
                    .frame(height: 1)
                    .padding(.horizontal)
                
                Button(action: {
                    self.showModal = false
                }) {
                    NudgeButton(title: "Go to Spark")
                }
                .padding(.vertical)

            }
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white, lineWidth: 10)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

            .padding()
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
            Spacer()
        }
    }
}

struct CompletedModal_Previews: PreviewProvider {
    static var previews: some View {
        CompletedModal(showModal: Binding.constant(true))
    }
}

struct Header: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
            VStack {
                Text("75")
                    .font(Font.system(size: 45, weight: .heavy, design: .default))
                Text("Thanks for your feedback!")
                    .font(Font.system(size: 21, weight: .semibold, design: .default))
            }
        }
        .frame(height: 200)
    }
}
