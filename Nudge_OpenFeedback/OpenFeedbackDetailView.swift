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
                
                ZStack {
                    Rectangle()
                        .frame(height: 200)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray, lineWidth: 1)
                    )
                    VStack {
                        TextField("Write your thoughts here", text: $feedback)
                            .padding()
                        Spacer()
                    }
                    .frame(height: 200)
                }
                .padding()
                
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
