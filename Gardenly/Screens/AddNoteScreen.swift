//
//  AddNoteScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/4/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteScreen: View {
    let myGardenVegetable: MyGardenVegetable
    
    @State private var noteTitle = ""
    @State private var noteBody = ""
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage?
    @State private var imageData: Data?
    @State private var isCameraSelected: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
            
            HStack(spacing: 20) {
                
                Button {
                    // action
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        isCameraSelected = true
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "camera.fill")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
                
                PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "photo.on.rectangle")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
            .buttonStyle(.borderless)
            
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    .padding()
            }
        }
        .task(id: selectedPhotoItem) {
            if let selectedPhotoItem {
                do {
                    if let data = try await selectedPhotoItem.loadTransferable(type: Data.self) {
                        uiImage = UIImage(data: data)
                        imageData = data
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .navigationTitle("\(myGardenVegetable.vegetable.name) Note")
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
        note.photo = imageData
        myGardenVegetable.notes?.append(note)
        try? context.save()
        dismiss()
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var myGardgenVegetables: [MyGardenVegetable]
    NavigationStack {
        AddNoteScreen(myGardenVegetable: myGardgenVegetables[0])
    }
    
}
