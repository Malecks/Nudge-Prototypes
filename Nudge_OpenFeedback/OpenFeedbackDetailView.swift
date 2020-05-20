//
//  OpenFeedbackDetailView.swift
//  Nudge_OpenFeedback
//
//  Created by Alex Mathers on 2020-05-19.
//  Copyright © 2020 Malecks. All rights reserved.
//

import SwiftUI

struct OpenFeedbackDetailView: View {
    @State private var feedback: String = ""
    @Binding var isRootActive: Bool
    var onComplete: (() -> ())?
    
    var body: some View {
        ScrollView {
            VStack {
                Text("This is a chance to add any additional thoughts you may have. Any answer you give will be submitted annonymously.")
                    .padding([.horizontal, .top])
                
                FeedbackEntryField(text: $feedback, placeholder: "Write your thoughts here...", height: 200)
                
                Button(action: {
                    self.isRootActive.toggle()
                    self.onComplete?()
                }) {
                    NudgeButton(title: "Submit Feedback")
                }
                
                Text("Skip this Step")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
        .navigationBarTitle("Follow-up")
    }
}

struct OpenFeedbackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OpenFeedbackDetailView(isRootActive: Binding.constant(false))
        }
    }
}

struct FeedbackEntryField: View {
    
    @Binding var text: String
    var placeholder: String
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: height)
                .foregroundColor(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(.secondarySystemBackground), lineWidth: 1)
            )
            VStack {
                TextField(placeholder, text: $text)
                    .padding()
                Spacer()
            }
            .frame(height: height)
        }
        .padding()
    }
}
