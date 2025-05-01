//
//  VegetableDetailScreen.swift
//  Gardenly
//
//  Created by Herbert Dodge on 5/1/25.
//

import SwiftUI

struct VegetableDetailScreen: View {
    let vegetable: Vegetable
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: vegetable.thumbnailImage) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .shadow(radius: 10)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            ProgressView()
                                .scaleEffect(1.5)
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        )
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(.bottom, 8)
                
                // Vegetable Name
                
                Text(vegetable.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Description
                Text(vegetable.body)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
                    .padding(.bottom, 8)
                
                Divider()
                
                Text("Quick Facts")
                    .font(.title2)
                    .fontWeight(.bold)
                
                DetailRow(icon: "leaf", title: "Seed Depth", value: vegetable.seedDepth)
            }
            .padding()
        }
    }
    
    struct DetailRow: View {
        
        let icon: String
        let title: String
        let value: String
        
        var body: some View {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(.green)
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(value)
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
            .padding(.vertical, 4)
        }
    }
}
#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadVegetables()[0])
}
