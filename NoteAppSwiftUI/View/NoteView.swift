//
//  NoteView.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 07.03.2023.
//

import SwiftUI
import RealmSwift

struct NoteView: View {
    
    @EnvironmentObject var contentVM: ContentViewModel
    @ObservedResults (Note.self) var note
    @State var headerNote: String = ""
    @State var bodyNote: String = ""
    @State var selectedNoteId: ObjectId?
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 15) {
                    TextField("Header note", text: $headerNote)
                        .padding()
                        .background(Color("lavender"))
                        .cornerRadius(10)
                    TextField("Body note", text: $bodyNote)
                        .padding()
                        .background(Color("lavender"))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    if selectedNoteId != nil {
                        $note.where = ({$0.id == selectedNoteId!})
                        $note.remove(note.first!)
                    }
                    
                    let note = Note()
                    note.noteTitle = headerNote
                    note.noteContent = bodyNote

                    $note.append(note)
                    
                    contentVM.noteViewIsOpen = false
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
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
            .onAppear {
                if selectedNoteId != nil {
                    $note.where = ({$0.id == selectedNoteId!})
                    $note.remove(note.first!)
                }
            }
        }
    }
    
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
