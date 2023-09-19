//
//  ContentView.swift
//  Environment
//
//  Created by ihenry on 2023/9/19.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    //Environment Propery Wrapper for open a ImmersiveSpace
        @Environment(\.openImmersiveSpace) private var openImmersiveSpace

        //Environment Propery Wrapper for closing a ImmersiveSpace
        @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

        //Boolean to check if ImmersiveSpace is active
        @State private var immersiveSpaceActive: Bool = false
        var body: some View {
            //Button to control the immersiveSpace appearance
            Button(immersiveSpaceActive ? "Exit VideoPlayer" : "Start VideoPlayer") {
                Task {
                    if !immersiveSpaceActive {
                        let result = await openImmersiveSpace(id: "VideoPlayer360")
                        immersiveSpaceActive = true
                    } else {
                        await dismissImmersiveSpace()
                        immersiveSpaceActive = false
                    }
                }
            }
        }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
