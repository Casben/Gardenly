//
//  AddNoteScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/4/25.
//

import SwiftUI

struct AddNoteScreen: View {
    let myGardenVegetable: MyGardenVegetable
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddNoteScreen(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
