//
//  AddNoteScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/4/25.
//

import SwiftUI

struct AddNoteScreen: View {
    let myGardenVegetable: MyGardenVegetable
    @State private var noteTitle = ""
    @State private var noteBody = ""
    @Environment(\.dismiss) private var dismiss
    
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
                    
                }
                
            }
        }
    }
}

#Preview {
    AddNoteScreen(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
