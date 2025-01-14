//
//  EntityGestureState.swift
//  RealityEssential
//
//  Created by Shohe Ohtani on 2025/01/14.
//

import RealityKit
import SwiftUI

#if os(visionOS)
@MainActor
public class EntityGestureState {
    
    /// The entity currently being dragged if a gesture is in progress.
    var targetedEntity: Entity?
    var isIgnoreAllGesture: Bool = false
    
    // MARK: - Tap
    public var tapStartPosition: SIMD3<Float> = .zero
    
    // MARK: - Drag
    
    /// The starting position.
    public var dragStartPosition: SIMD3<Float> = .zero
    
    /// Marks whether the app is currently handling a drag gesture.
    public var isDragging = false
    
    /// When `rotateOnDrag` is`true`, this entity acts as the pivot point for the drag.
    var pivotEntity: Entity?
    
    var initialOrientation: simd_quatf?
    
    // MARK: - Magnify
    
    /// The starting scale value.
    public var startScale: SIMD3<Float> = .one
    
    /// Marks whether the app is currently handling a scale gesture.
    public var isScaling = false
    
    // MARK: - Rotation
    
    /// The starting rotation value.
    public var startOrientation = Rotation3D.identity
    
    /// Marks whether the app is currently handling a rotation gesture.
    public var isRotating = false
    
    // MARK: - Singleton Accessor
    
    /// Retrieves the shared instance.
    static let shared = EntityGestureState()
}
#endif
