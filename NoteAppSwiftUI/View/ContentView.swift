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
    @State private var showAlert = false
    @State var folderName = ""
    @State var selectedFolderId: ObjectId? = nil
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(folders, id: \.id) { folder in
                        NavigationLink {
                            NotesView(folder: folder)
                                .environmentObject(contentVM)
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
        }
        
    }
    
    @ViewBuilder
    func addFolder() -> some View {
        Button {
            showAlert = true
        } label: {
            Text("Add folder")
        }
        .alert("Add new folder", isPresented: $showAlert) {
            TextField("Folder name", text: $folderName)
            Button("Add") {
                let folder = Folder()
                folder.name = folderName

                $folders.append(folder)
                
                folderName = ""
            }
            Button("Cancel", role: .cancel, action: {})
        }
        
        }

}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
