//
//  HomeView.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Home Screen")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
