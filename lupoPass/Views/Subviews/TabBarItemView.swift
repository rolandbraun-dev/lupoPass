//
//  TabBarItemView.swift
//  lupoPass
//
//  Created by Roland Braun on 9/1/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import SwiftUI

struct TabBarItemView: View {
    
    var itemImage = Image(systemName: "shield.fill")
    var itemText = "defaultText"
    
    var associatedView = ""
    @EnvironmentObject var currentView: GlobalCurrentView
    
    var body: some View {
        VStack {
            // Show active view with different Color of tab bar item
            if self.associatedView == currentView.display {
                itemImage
                .font(.system(size: 22, weight: .light))
                .foregroundColor(Color(UIColor(named: "TabBarTextColorActive")!))
                
                Text(itemText)
                .font(.system(size: 11))
                .foregroundColor(Color(UIColor(named: "TabBarTextColorActive")!))
            } else {
                itemImage
                .font(.system(size: 22, weight: .light))
                .foregroundColor(Color(UIColor(named: "TabBarTextColor")!))
                
                Text(itemText)
                .font(.system(size: 11))
                .foregroundColor(Color(UIColor(named: "TabBarTextColor")!))
            }
        }
            .contentShape(Rectangle())
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(EdgeInsets(top: 8, leading: 4, bottom: 3, trailing: 3))
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView().environmentObject(GlobalCurrentView())
    }
}
