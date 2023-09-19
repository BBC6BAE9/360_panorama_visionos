//
//  EnvironmentApp.swift
//  Environment
//
//  Created by ihenry on 2023/9/19.
//

import SwiftUI

@main
struct EnvironmentApp: App {
    //Select immersionStyle
    @State private var immersionStyle: ImmersionStyle = .full //For example you also can use .mixed for a mixed ImmersionStyle
    var body: some Scene {
        WindowGroup {
            //Starting Window to control entry in the ImmersiveSpace
            ContentView()
        }
        ImmersiveSpace(id: "VideoPlayer360") {
            //struct with the RealityView
            Video360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)

    }
}
