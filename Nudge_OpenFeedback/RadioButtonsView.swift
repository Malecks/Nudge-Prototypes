//
//  RadioButtonsView.swift
//  Nudge_OpenFeedback
//
//  Created by Alex Mathers on 2020-05-20.
//  Copyright © 2020 Malecks. All rights reserved.
//

import SwiftUI

struct AnswerOption: Hashable {
    let id: Int
    var selected: Bool = false
    let title: String
}

struct RadioButtonsView: View {
    @State private var feedback = ""
    @State private var showModal = false
    
    @State var answerOptions: [AnswerOption]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    NudgeHeader()
                    
                    Color(.secondarySystemBackground)
                        .frame(height: 1.0)
                    
                    NudgeSubheader()
                    
                    Text("Here's some Nudge content for a Survey with an optional open-ended feedback submission. You can select a Survey option and then be presented with a follow-up text field to leave additional thoughts.")
                        .padding()
                    
                    ForEach(answerOptions, id: \.self) { option in
                        Button(action: {
                            let index = self.answerOptions.firstIndex(of: option)
                            self.answerOptions = self.answerOptions.map { AnswerOption(id: $0.id, selected: false, title: $0.title) }
                            self.answerOptions[index!].selected.toggle()
                        }) {
                            SurveyButton(selected: option.selected, title: option.title)
                        }
                    }
                    
                    FeedbackEntryField(text: $feedback, placeholder: "Add any addition thoughts you have...", height: 100)
                    
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        NudgeButton(title: "Submit")
                    }
                    .padding(.bottom)

                }
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
                .padding(10)

            }
            .background(Color(.secondarySystemBackground))
            .edgesIgnoringSafeArea(.bottom)
            
            CompletedModal(showModal: $showModal)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .opacity( showModal ? 1 : 0)
                .animation(.easeInOut)
        }
    }
    
}

struct RadioButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonsView(answerOptions: [
            AnswerOption(id: 1, selected: false, title: "Strongly Agree"),
            AnswerOption(id: 2, selected: false, title: "Agree"),
            AnswerOption(id: 3, selected: false, title: "Neutral"),
            AnswerOption(id: 4, selected: false, title: "Disagree"),
            AnswerOption(id: 5, selected: false, title: "Strongly Disagree")
        ])
    }
}

struct SurveyButton: View {
    var selected: Bool
    var title: String
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                ZStack {
                    Circle()
                        .stroke(Color.black, lineWidth: 1.5)
                        .frame(width: 20, height: 20)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.blue)
                        .opacity(selected ? 1 : 0)
                }
                
                Text(title)
                    .font(Font.system(.subheadline))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(selected ? Color.blue : Color(.secondarySystemBackground), lineWidth: 1)
                .frame(height: 40)
        }
        .padding(.horizontal)
    }
}
