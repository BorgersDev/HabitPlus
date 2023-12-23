//
//  HabitPlusApp.swift
//  HabitPlus
//
//  Created by Arthur Borges on 21/12/23.
//

import SwiftUI

@main
struct HabitPlusApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
