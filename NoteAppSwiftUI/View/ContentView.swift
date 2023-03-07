//
//  ContentView.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 07.03.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentViewModel()
    @ObservedResults (Folder.self) var folders
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(folders, id: \.id) { folder in
                        NavigationLink {
                            NotesView(folder: folder.name)
                        } label: {
                            Text(folder.name)
                        }

                    }
                    .onDelete { index in
                        $folders.remove(atOffsets: index)
                    }
                }
                .navigationTitle("All notes")
                .navigationBarItems(trailing: addFolder())
            }
            
            if contentVM.notesViewIsOpen {
                NotesView()
                    .environmentObject(contentVM)
            }
        }
        
    }
    
    @ViewBuilder
    func addFolder() -> some View {
        Button {
            contentVM.notesViewIsOpen = true
        } label: {
            Text("Add folder")
        }

    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
