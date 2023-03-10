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
    @State var folder: Folder?
    @State var nameNote = ""
    @State var selectedNoteId: ObjectId? = nil
    @State var note: Note?
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    if folder != nil {
                        ForEach(folder!.notes, id: \.id) { note in
                            NavigationLink {
                                NoteView(selectedNoteId: note.id)
                            } label: {
                                Text(note.noteTitle)
                            }

                        }
                    }
                }
                .navigationTitle(folder?.name ?? "")
                .navigationBarItems(trailing: addNote())
            }
            if contentVM.noteViewIsOpen {
                NoteView(selectedNoteId: selectedNoteId)
                    .environmentObject(contentVM)
            }

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
