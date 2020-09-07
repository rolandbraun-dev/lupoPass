//
//  TabBarView.swift
//  lupoPass
//
//  Created by Roland Braun on 9/1/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var currentView: GlobalCurrentView
    
    var body: some View {
        HStack(spacing:0) {
            TabBarItemView(itemImage: Image(systemName: "globe"), itemText: "Items", associatedView: "ItemsView")
                .onTapGesture {
                    self.currentView.display = "ItemsView"
            }
            
            TabBarItemView(itemImage: Image(systemName: "doc"), itemText: "Settings", associatedView: "SettingsView")
                .onTapGesture {
                    self.currentView.display = "SettingsView"
            }
            
            TabBarItemView(itemImage: Image(systemName: "paperplane"), itemText: "Settings")
            
            TabBarItemView(itemImage: Image(systemName: "gear"), itemText: "Settings")
        }
            .background(Rectangle().fill(Color(UIColor(named: "TabBarBackgroundColor")!)).shadow(radius: 1))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44, maxHeight: 44)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(GlobalCurrentView())
    }
}
