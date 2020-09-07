//
//  ItemsCellView.swift
//  lupoPass
//
//  Created by Roland Braun on 9/3/20.
//  Copyright © 2020 Roland Braun. All rights reserved.
//

import SwiftUI

struct ItemsCellView: View {
    
    var title = "defaultTitle"
    var subtitle = "defautSubtitle"
    var icon = Image(systemName: "signature")
    
    var body: some View {
        
        HStack {
            VStack {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                Text(subtitle).font(.footnote)
            }
        }
    }
}

struct ItemsCellView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsCellView()
    }
}
