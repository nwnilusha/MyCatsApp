//
//  ImageTypeView.swift
//  GallagherTechnicalChallenge
//
//  Created by Nilusha Wimalasena on 2022-07-16.
//

import SwiftUI

struct ImageTypeView: View {
    
    var imageType = ["gif", "jpg,png", "gif,jpg,png"]
    @State private var selectedImage = "Gif"
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:10){
                Label("Please Select image type", systemImage: "book.fill")
                
                Picker("Please choose image type :", selection: $selectedImage) {
                                ForEach(imageType, id: \.self) {
                                    Text($0)
                    }
                }
                Text("Selected image type : \(selectedImage)")
                
                NavigationLink(destination: CatsListView(imageType: selectedImage), label:{
                    Text("Cats List")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                })
            }
            .navigationTitle("Cats Images")
        }
    }
}

struct ImageTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTypeView()
    }
}
