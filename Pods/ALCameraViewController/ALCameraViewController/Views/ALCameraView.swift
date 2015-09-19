//
//  ALCameraView.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/17.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit
import AVFoundation

public class ALCameraView: UIView {
    
    var session: AVCaptureSession!
    var input: AVCaptureDeviceInput!
    var device: AVCaptureDevice!
    var imageOutput: AVCaptureStillImageOutput!
    var preview: AVCaptureVideoPreviewLayer!
    
    let cameraQueue = dispatch_queue_create("com.zero.ALCameraViewController.Queue", DISPATCH_QUEUE_SERIAL);
    
    public var currentPosition = AVCaptureDevicePosition.Back
    
    public func startSession() {
        createPreview()
        
        dispatch_async(cameraQueue) {
            self.session.startRunning()
        }
    }
    
    public func stopSession() {
        if session != nil {
            dispatch_async(cameraQueue) {
                self.session.stopRunning()
                self.preview.removeFromSuperlayer()
                
                self.session = nil
                self.input = nil
                self.imageOutput = nil
                self.preview = nil
                self.device = nil
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if let p = preview {
            p.frame = bounds
        }
    }
    
    private func createPreview() {
        session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetHigh
        
        device = cameraWithPosition(currentPosition)
        
        let outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
        
        
        let input = AVCaptureDeviceInput()
       
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        imageOutput = AVCaptureStillImageOutput()
        imageOutput.outputSettings = outputSettings
        
        session.addOutput(imageOutput)
        
        preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = AVLayerVideoGravityResizeAspectFill
        preview.frame = bounds
        
        layer.addSublayer(preview)
    }
    
    private func cameraWithPosition(position: AVCaptureDevicePosition) -> AVCaptureDevice? {
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        var _device: AVCaptureDevice?
        for d in devices {
            if d.position == position {
                _device = d as? AVCaptureDevice
                break
            }
        }
        
        return _device
    }
    
    public func capturePhoto(completion: ALCameraShotCompletion) {
        dispatch_async(cameraQueue) {
            ALCameraShot().takePhoto(self.imageOutput, videoOrientation: self.preview.connection.videoOrientation, cropSize: self.frame.size) { image in
                
                var correctedImage = image
                
                if self.currentPosition == AVCaptureDevicePosition.Front {
                    correctedImage = UIImage(CGImage: image.CGImage!, scale: image.scale, orientation:.UpMirrored)!
                }
                
                completion(correctedImage)
            }
        }
    }

    public func swapCameraInput() {
        if session != nil && input != nil {
            session.beginConfiguration()
            session.removeInput(self.input)
            
            if self.input.device.position == AVCaptureDevicePosition.Back {
                currentPosition = AVCaptureDevicePosition.Front
                device = cameraWithPosition(currentPosition)
            } else {
                currentPosition = AVCaptureDevicePosition.Back
                device = cameraWithPosition(currentPosition)
            }
            
            
            let input = AVCaptureDeviceInput()
            
            
            session.addInput(input)
            session.commitConfiguration()
        }
    }

}