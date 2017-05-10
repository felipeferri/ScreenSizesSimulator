//
//  SizesSimulatorViewController.swift
//  Spider Experiments
//
//  Created by Felipe Augusto Sviaghin Ferri on 4/5/17.
//  Copyright © 2017 Felipe Augusto Sviaghin Ferri. All rights reserved.
//

import UIKit

enum PhoneModel {
    case iPhone4S, iPhone5S, iPhone6S, iPhone6SPlus
}

struct ScreenSize {
    var width: CGFloat
    var height: CGFloat
    
    static let iPhone4S = ScreenSize(width: 320, height: 480)
    static let iPhone5S = ScreenSize(width: 320, height: 568)
    static let iPhone6S = ScreenSize(width: 375, height: 667)
    static let iPhone6SPlus = ScreenSize(width: 414, height: 736)
    
}

class SizesSimulatorViewController: UIViewController {
    @IBOutlet weak var containerHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerWidthLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var iPhoneModelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var zoomLevelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var controlPanelView: UIView!
    

    var phoneModel: PhoneModel = .iPhone6S {
        didSet {
            switch phoneModel {
            case .iPhone4S:
                screenSize = ScreenSize.iPhone4S
            case .iPhone5S:
                screenSize = ScreenSize.iPhone5S
            case .iPhone6S:
                screenSize = ScreenSize.iPhone6S
            case .iPhone6SPlus:
                screenSize = ScreenSize.iPhone6SPlus
            }
            updateUI()
        }
    }
    
    var screenSize: ScreenSize? {
        didSet {
            if let screenSize = screenSize {
                containerWidthLayoutConstraint.constant = screenSize.width
                containerHeightLayoutConstraint.constant = screenSize.height
            }
        }
    }
    @IBAction func iPhoneModelSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        phoneModel = [PhoneModel.iPhone4S, PhoneModel.iPhone5S, PhoneModel.iPhone6S, PhoneModel.iPhone6SPlus][sender.selectedSegmentIndex]
    }
    
    @IBAction func zoomLevelSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        updateUI()
    }
    
    func updateUI() {
        switch zoomLevelSegmentedControl.selectedSegmentIndex {
        case 0:
            containerView.transform = CGAffineTransform.identity
        case 1:
            containerView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        case 2:
            if let screenSize = screenSize {
                let zoom = min(view.frame.size.height/screenSize.height, view.frame.size.width/screenSize.width)
                containerView.transform = CGAffineTransform(scaleX: zoom, y: zoom)
            }
        case 3:
            if let screenSize = screenSize {
                let zoom = max(view.frame.size.height/screenSize.height, view.frame.size.width/screenSize.width)
                containerView.transform = CGAffineTransform(scaleX: zoom, y: zoom)
            }
        default:
            containerView.transform = CGAffineTransform.identity
        }
    }
    
    override func viewDidLoad() {
        phoneModel = .iPhone6S
        iPhoneModelSegmentedControl.selectedSegmentIndex = 2
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            controlPanelView.isHidden = false
        }
    }
    @IBAction func controlPanelTap(_ sender: UITapGestureRecognizer) {
        controlPanelView.isHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            if let screenSize = screenSize {
                containerWidthLayoutConstraint.constant = screenSize.height
                containerHeightLayoutConstraint.constant = screenSize.width
            }
        } else {
            if let screenSize = screenSize {
                containerWidthLayoutConstraint.constant = screenSize.width
                containerHeightLayoutConstraint.constant = screenSize.height
            }
        }
    }

}
