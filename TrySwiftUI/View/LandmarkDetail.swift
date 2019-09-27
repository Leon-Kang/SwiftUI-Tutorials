//
//  ContentView.swift
//  44584
//
//  Created by Leon Kang on 2019/9/26.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmark.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.landmark[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmark[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                            .foregroundColor(.gray)
                        }
                    }
                }

                HStack(alignment: .top, spacing: 16) {
                    Text(landmark.park)
                        .font(.caption)
                    Spacer()
                    Text(landmark.state)
                        .font(.caption)
                }
                
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
