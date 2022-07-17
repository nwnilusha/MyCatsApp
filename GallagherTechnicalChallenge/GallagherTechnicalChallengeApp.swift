//
//  GallagherTechnicalChallengeApp.swift
//  GallagherTechnicalChallenge
//
//  Created by Nilusha Wimalasena on 2022-07-16.
//

import SwiftUI

@main
struct GallagherTechnicalChallengeApp: App {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
    }
    
    var body: some Scene {
        WindowGroup {
            ImageTypeView()
        }
    }
}
