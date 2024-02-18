//
//  Splash.swift
//  A20
//
//  Created by 드즈 on 2/19/24.
//

import SwiftUI

extension TabBar {
    var splash: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Image("Logo")
        }
    }
}
