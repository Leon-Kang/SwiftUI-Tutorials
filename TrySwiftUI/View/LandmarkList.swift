//
//  LandmarkList.swift
//  TrySwiftUI
//
//  Created by LeonKang on 2019/9/26.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(userData.landmark) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Landmarks"))
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhoneSE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//
//        }
        LandmarkList()
            .environmentObject(UserData())
    }
}
