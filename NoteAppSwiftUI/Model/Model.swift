//
//  Model.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 07.03.2023.
//

import Foundation
import RealmSwift

class Folder: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var notes: List<Note>
}

class Note: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var noteTitle: String = ""
    @Persisted var noteContent: String = ""
    @Persisted var date: Date = Date()
    
    @Persisted(originProperty: "notes") var assignee: LinkingObjects<Folder>
}
