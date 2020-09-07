//
//  ContentView.swift
//  lupoPass
//
//  Created by Roland Braun on 9/1/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var currentView: GlobalCurrentView // EnvironmentObject -> truth for the current main view
    @EnvironmentObject var dataModel: GlobalDataModel
    
    var body: some View {
        
        VStack {
            // Switch between main content views
            if self.currentView.display == "ItemsView" {
                //ItemsView()
                ItemsView()
            } else if self.currentView.display == "SettingsView" {
                SettingsView()
            }
            
            Spacer()
            // TabBar disabled. Trying not to use it.
            //TabBarView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalCurrentView()).environmentObject(GlobalDataModel())
    }
}
