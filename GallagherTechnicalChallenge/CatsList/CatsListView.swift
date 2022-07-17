//
//  CatsListView.swift
//  GallagherTechnicalChallenge
//
//  Created by Nilusha Wimalasena on 2022-07-16.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatsListView: View {

    @ObservedObject var allCats:CatListViewModel
    
    init(imageType:String){
        allCats = CatListViewModel(catImageType: imageType)
    }
    var body: some View {
        VStack(spacing:20){
                List(){
                    ForEach(allCats.cats){cat in
                        NavigationLink(destination: CatsDetailView(cats: cat), label: {
                            catsList(categoryName: cat.name, width: cat.width,height: cat.height, id:cat.id, catURL: cat.url)
                        })
                    }
                    
                    if allCats.catURL != ""{
                        Text("Featching data")
                            .onAppear(perform:{
                                allCats.getAllCatsList()
                            })
                    }
                }
                .navigationTitle("My Cats List")
        }
    }
}

struct CatsListView_Previews: PreviewProvider {
    static var previews: some View {
        CatsListView(imageType: "gif")
    }
}

struct catsList : View{
    var categoryName:String
    var width:String
    var height:String
    var id:String
    var catURL:String
    
    var body: some View{
        HStack{
            AnimatedImage(url: URL(string: catURL))
                .resizable()
                .frame(width: 80, height: 80)
            
            
            VStack{
                Text("ID : " + id)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Text("Size : " + width + "*" + height)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
            }
        }
        
    }
}
