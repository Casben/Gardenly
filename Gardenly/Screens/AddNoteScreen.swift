//
//  AddNoteScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/4/25.
//

import SwiftUI
import SwiftData

struct AddNoteScreen: View {
    let myGardenVegetable: MyGardenVegetable
    
    @State private var noteTitle = ""
    @State private var noteBody = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
        }
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNote()
                }
                
            }
        }
    }
    
    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        myGardenVegetable.notes?.append(note)
        try? context.save()
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var myGardgenVegetables: [MyGardenVegetable]
    
    AddNoteScreen(myGardenVegetable: myGardgenVegetables[0])
}
