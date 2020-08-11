//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Chitralekha Yellewar on 10/08/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = true
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle("Landmarks")
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
