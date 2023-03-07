//
//  NoteView.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 07.03.2023.
//

import SwiftUI

struct NoteView: View {
    
    @EnvironmentObject var contentVM: ContentViewModel
    
    @State var headerNote: String = ""
    @State var bodyNote: String = ""
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Header note", text: $headerNote)
                    .padding()
                    .border(.gray)
                    .cornerRadius(10)
                TextField("Body note", text: $bodyNote)
                    .padding()
                    .border(.gray)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("Save")
            })
            .frame(maxWidth: .infinity)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.pink)
            .clipShape(Capsule())
            
        }
        .padding()
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
