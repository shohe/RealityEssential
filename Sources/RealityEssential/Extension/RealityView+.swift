//
//  RealityView+.swift
//  RealityEssential
//
//  Created by Shohe Ohtani on 2025/01/14.
//

import RealityKit
import SwiftUI

#if os(visionOS)
public extension RealityView {
    
    /// Apply this to a `RealityView` to pass gestures on to the component code.
    func installGestures() -> some View {
        simultaneousGesture(tapGesture)
            .simultaneousGesture(dragGesture)
            .simultaneousGesture(magnifyGesture)
            .simultaneousGesture(rotateGesture)
    }
    
    /// Builds a tap gesture.
    var tapGesture: some Gesture {
        TapGesture()
            .targetedToAnyEntity()
            .useGestureComponent()
    }
    
    /// Builds a drag gesture.
    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .useGestureComponent()
    }
    
    /// Builds a magnify gesture.
    var magnifyGesture: some Gesture {
        MagnifyGesture()
            .targetedToAnyEntity()
            .useGestureComponent()
    }
    
    /// Buildsa rotate gesture.
    var rotateGesture: some Gesture {
        RotateGesture3D()
            .targetedToAnyEntity()
            .useGestureComponent()
    }
}
#endif
