//
//  CatsDetailView.swift
//  GallagherTechnicalChallenge
//
//  Created by Nilusha Wimalasena on 2022-07-16.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatsDetailView: View {
    var cats:cat
    
    var body: some View {
        VStack(spacing:20){
            
            Spacer()
            
            Text(cats.id)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            AnimatedImage(url: URL(string: cats.url))
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(15)
            
            HStack(spacing:40){
                
                Label("ID :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(cats.id)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing:40){
                
                Label("Width :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(cats.height)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing:40){
                
                Label("Height :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(cats.height)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        
    }
}
