//
//  ItemsView.swift
//  lupoPass
//
//  Created by Roland Braun on 9/1/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    
    @EnvironmentObject var dataModel: GlobalDataModel
    @State var addNewEntryIsPresented = false
    
    let me = 0
    var body: some View {
        NavigationView {
            List {
                
                Section(header: Text("A")) {
                    ForEach(0..<self.dataModel.getListOfAllItems().count/2) { item in
                        ItemsCellView(title: self.dataModel.getListOfAllItems()[item].title)
                    }
                }
                
                Section(header: Text("B")) {
                    ForEach(self.dataModel.getListOfAllItems().count/2..<self.dataModel.getListOfAllItems().count) { item in
                        ItemsCellView(title: self.dataModel.getListOfAllItems()[item].title)
                    }
                }
            }
                .navigationBarTitle("Items")
                .navigationBarItems(trailing: Button(action: {
                    self.addNewEntryIsPresented.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 25, weight: .light))
                    
                }.sheet(isPresented: $addNewEntryIsPresented) {
                    AddNewItemView()
                    }
                )
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView().environmentObject(GlobalDataModel())
    }
}
