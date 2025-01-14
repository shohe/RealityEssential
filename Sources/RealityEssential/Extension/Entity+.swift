//
//  Entity+.swift
//  RealityEssential
//
//  Created by Shohe Ohtani on 2025/01/14.
//

import RealityKit
import SwiftUI

#if os(visionOS)
public extension Entity {
    
    var gestureComponent: GestureComponent? {
        get { components[GestureComponent.self] }
        set { components[GestureComponent.self] = newValue }
    }
    
    /// Returns the position of the entity specified in the app's coordinate system. On
    /// iOS and macOS, which don't have a device native coordinate system, scene
    /// space is often referred to as "world space".
    var scenePosition: SIMD3<Float> {
        get { position(relativeTo: nil) }
        set { setPosition(newValue, relativeTo: nil) }
    }
    
    /// Returns the orientation of the entity specified in the app's coordinate system. On
    /// iOS and macOS, which don't have a device native coordinate system, scene
    /// space is often referred to as "world space".
    var sceneOrientation: simd_quatf {
        get { orientation(relativeTo: nil) }
        set { setOrientation(newValue, relativeTo: nil) }
    }
    
    @MainActor
    private struct AssociatedKeys {
        static var onTapGestureKey: UInt8 = 0
        static var onDragGestureKey: UInt8 = 1
        static var onScaleGestureKey: UInt8 = 2
        static var onRotateGestureKey: UInt8 = 4
    }

    public var onTapGesture: ((EntityTargetValue<TapGesture.Value>) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onTapGestureKey) as? (EntityTargetValue<TapGesture.Value>) -> Void
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.onTapGestureKey,
                    newValue as ((EntityTargetValue<TapGesture.Value>) -> Void)?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    // drag: EntityTargetValue<DragGesture.Value>
    // isEnded: Bool
    public var onDragGesture: ((EntityTargetValue<DragGesture.Value>, Bool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onDragGestureKey) as? (EntityTargetValue<DragGesture.Value>, Bool) -> Void
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.onDragGestureKey,
                    newValue as ((EntityTargetValue<DragGesture.Value>, Bool) -> Void)?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    // scale: EntityTargetValue<MagnifyGesture.Value>
    // status: EntityGestureState
    public var onScaleGesture: ((EntityTargetValue<MagnifyGesture.Value>, EntityGestureState) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onScaleGestureKey) as? (EntityTargetValue<MagnifyGesture.Value>, EntityGestureState) -> Void
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.onScaleGestureKey,
                    newValue as ((EntityTargetValue<MagnifyGesture.Value>, EntityGestureState) -> Void)?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    // scale: EntityTargetValue<EntityTargetValue<RotateGesture3D.Value>
    // status: EntityGestureState
    public var onRotateGesture: ((EntityTargetValue<RotateGesture3D.Value>, EntityGestureState) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onRotateGestureKey) as? (EntityTargetValue<RotateGesture3D.Value>, EntityGestureState) -> Void
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.onRotateGestureKey,
                    newValue as ((EntityTargetValue<RotateGesture3D.Value>, EntityGestureState) -> Void)?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    public func installGesture(canTap: Bool = false, canDrag: Bool = false, canScale: Bool = false, canRotate: Bool = false) {
        components.set(InputTargetComponent())
        generateCollisionShapes(recursive: true)
        gestureComponent = GestureComponent(canTap: canTap, canDrag: canDrag, canScale: canScale, canRotate: canRotate)
    }
}
#endif
