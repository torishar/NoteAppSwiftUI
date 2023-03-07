//
//  ContentViewModel.swift
//  NoteAppSwiftUI
//
//  Created by Viktoriia Sharukhina on 08.03.2023.
//

import SwiftUI
import RealmSwift

class ContentViewModel: ObservableObject {
    @Published var notesViewIsOpen = false
    @Published var noteViewIsOpen = false
}
