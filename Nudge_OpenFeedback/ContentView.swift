//
//  ContentView.swift
//  Nudge_OpenFeedback
//
//  Created by Alex Mathers on 2020-05-19.
//  Copyright © 2020 Malecks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    
    @State var showModal: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack(spacing: 0) {
                        NudgeHeader()
                    
                        Color(white:0.9)
                            .frame(height: 1.0)
                        
                        NudgeSubheader()
                        
                        Text("Here's some Nudge content for a Survey with an optional open-ended feedback submission. You can select a Survey option and then be presented with a follow-up text field to leave additional thoughts.")
                            .padding()
                        
                        NavigationLink(
                        destination: SurveyDetailView(
                            isRootActive: $isActive,
                            onComplete: surveyCompleted
                        
                        ), isActive: $isActive) {
                            NudgeButton(title: "Take the Survey")
                        }
                        .isDetailLink(false)
                        .padding(.bottom)
                        Spacer()
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .padding(5)
                    .padding(.top, 20)
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
                }
                .navigationBarTitle("Nudge Feed")
                .background(Color(white: 0.95))
                .edgesIgnoringSafeArea(.bottom)
            }
            
            CompletedModal(showModal: $showModal)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .opacity( showModal ? 1 : 0)
                .animation(.easeInOut)
        }
    }
    
    func surveyCompleted() {
        delay(0.5) {
            self.showModal = true
        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NudgeHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "square")
                .font(Font.system(size: 25, weight: .semibold, design: .rounded))
            Text("Survey")
                .font(Font.system(.title))
                .fontWeight(.semibold)
            Spacer()
            ZStack {
                Rectangle()
                    .frame(width: 50, height: 30)
                    .cornerRadius(15)
                    .foregroundColor(.yellow)
                
                Text("25")
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

struct NudgeSubheader: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Employee Survey")
                .fontWeight(.semibold)
            Text("Jan. 21, 4:30 PM")
                .font(Font.system(.caption))
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding([.horizontal, .top])
    }
}

struct NudgeButton: View {
    var title: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.yellow)
                .cornerRadius(3)
                .frame(height: 60)
                .padding(.horizontal)
            
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
    }
}
