//
//  NotesView.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 07.03.2023.
//

import SwiftUI
import RealmSwift

struct NotesView: View {
    
    @EnvironmentObject var contentVM: ContentViewModel
    
    @State var folder: String = "Name folder"
    
    @State var selectedFilderId: ObjectId?
    
    var body: some View {
        VStack {
            List {
                Text("1")
                Text("2")
                Text("3")
            }
            .navigationTitle(folder)
            .navigationBarItems(trailing: addNote())
        }

    }
    @ViewBuilder
    func addNote() -> some View {
        Button {
            contentVM.noteViewIsOpen = true
        } label: {
            Text("Add note")
        }

    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
