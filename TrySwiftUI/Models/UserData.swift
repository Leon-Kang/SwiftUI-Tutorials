//
//  UserData.swift
//  TrySwiftUI
//
//  Created by Leon Kang on 2019/9/27.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmark = landmarkData
}
