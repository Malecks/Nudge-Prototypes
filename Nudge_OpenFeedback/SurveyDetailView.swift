//
//  SurveyDetailView.swift
//  Nudge_OpenFeedback
//
//  Created by Alex Mathers on 2020-05-19.
//  Copyright © 2020 Malecks. All rights reserved.
//

import SwiftUI

struct SurveyDetailView: View {
    @Binding var isRootActive: Bool
    var onComplete: (() -> ())?

    let answerOptions = [
    "Strongly Agree",
    "Agree",
    "Neutral",
    "Disagree",
    "Strongly Disagree"
    ]
    
    var body: some View {
        ScrollView{
            SurveyQuestion(
                question: "Here's some Nudge content for a Survey with an optional open-ended feedback submission. You can select a Survey option and then be presented with a follow-up text field to leave additional thoughts.",
                answerOptions: answerOptions,
                isRootActive: $isRootActive,
                onComplete: onComplete
            )
                .navigationBarTitle("Question 1")
            
        }
    }
}

struct SurveyQuestion: View {
    let question: String
    let answerOptions: [String]
    
    @Binding var isRootActive: Bool
    var onComplete: (() -> ())?
    
    var body: some View {
        VStack {
            Text(question)
                .padding()
            
            ForEach(answerOptions, id: \.self) { answer in
                NavigationLink(
                destination: OpenFeedbackDetailView(
                    isRootActive: self.$isRootActive, onComplete: self.onComplete)) {
                    NudgeButton(title: answer)
                }
                .isDetailLink(false)
            }
            
            NavigationLink(destination: OpenFeedbackDetailView(isRootActive: $isRootActive)) {
                Text("Skip This Question")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .isDetailLink(false)
            .padding()
            
            Spacer()
        }
    }
}

struct SurveyDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            SurveyDetailView(isRootActive: Binding.constant(false), onComplete: nil)
        }
    }
}
