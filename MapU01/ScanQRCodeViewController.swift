//
//  ScanQRCodeViewController.swift
//  MapU01
//
//  Created by ting pan on 2020/10/26.
//  Copyright © 2020 MapU. All rights reserved.
//

import UIKit
import AVKit

class ScanQRCodeViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    var frameView: UIView?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var captureSession: AVCaptureSession?
        

        
        let outPut = AVCaptureMetadataOutput()
        captureSession?.addOutput(outPut)
        
        outPut.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        outPut.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        messageLabel.isHidden = true
        view.bringSubviewToFront(messageLabel)
        
        frameView = UIView()
        
        if let detectView = frameView {
            
            detectView.layer.borderColor = UIColor.green.cgColor
            detectView.layer.borderWidth = 2.0
            
            view.addSubview(detectView)
            view.bringSubviewToFront(detectView)
        }
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        
        if metadataObjects.count == 0 {
            
            frameView?.frame = CGRect.zero
            messageLabel.isHidden = true
            
            return
        }
        
        if let metaDataObj = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
            
            if let QRCode = previewLayer?.transformedMetadataObject(for: metaDataObj) {
                
                frameView?.frame = QRCode.bounds
                
            }
                
            if let linkage = metaDataObj.stringValue {
                messageLabel.isHidden = false
                messageLabel.text = linkage
                
            } else {
                print("no result!!!")
            }
                 
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
