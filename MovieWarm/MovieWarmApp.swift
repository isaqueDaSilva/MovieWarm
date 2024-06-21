//
//  MovieWarmApp.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

@main
struct MovieWarmApp: App {
    @State private var isSplashViewPresented = true
    
    @Namespace private var transition
    private var transitionKey = "TRANSITION"
    
    var body: some Scene {
        WindowGroup {
            if isSplashViewPresented {
                SplashView(isSplashViewShowing: $isSplashViewPresented)
                    .matchedGeometryEffect(id: transitionKey, in: transition)
            } else {
                HomeView()
                    .matchedGeometryEffect(id: transitionKey, in: transition)
            }
        }
    }
}
