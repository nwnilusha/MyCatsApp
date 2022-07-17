//
//  CatsListViewModel.swift
//  GallagherTechnicalChallenge
//
//  Created by Nilusha Wimalasena on 2022-07-16.
//

import Foundation
import Alamofire
import SwiftyJSON

class CatListViewModel:ObservableObject{
    @Published var cats = [cat]()
    static var pageNumber:Int = 1
    var catURL:String = ""
    
    var allCats:cat = cat(id: "", name: "", width: "", height: "", url: "")
    
    init(catImageType: String){
        catURL = "https://api.thecatapi.com/v1/images/search?api_key=b84255e5-0788-4258-aa10-f659ceb6b3c5&limit=10&page=1&mime_types=\(catImageType)&order=random"

        setupPublishers()
        
    }
    
    private func setupPublishers(){
        getAllCatsList()
    }
    
    // Get all cat details through network call
    func getAllCatsList(){
        
        AF.request(catURL).response { response in
            let json = try! JSON(data: response.data!)
            CatListViewModel.pageNumber += 1
            self.catURL = "https://api.thecatapi.com/v1/images/search?api_key=b84255e5-0788-4258-aa10-f659ceb6b3c5&limit=10&page=\(CatListViewModel.pageNumber)&mime_types=gif&order=random"
            print(self.catURL)
            
            for i in json{
                let category = i.1["categories"]
                let catName = self.filterCategoryName(imageCategory: category)
                if catName != "hats" {
                    self.cats.append(cat(id: i.1["id"].stringValue, name: catName, width: i.1["width"].stringValue, height: i.1["height"].stringValue, url: i.1["url"].stringValue))
                }
            }
        }
    }
    
    //Filter any image with the category name
    func filterCategoryName(imageCategory:JSON) -> String{
        var catName:String = ""
        for j in imageCategory{
            catName = j.1["name"].stringValue
        }
        return catName
    }
}
