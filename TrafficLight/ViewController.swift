//
//  ViewController.swift
//  TrafficLight
//
//  Created by Roman on 18.09.2022.
//

import UIKit

// MARK: ViewController
class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var actionButton: UIButton!

    // MARK: Storage property
    var colorCounter = 0
    
    // MARK: Computed property
    var colorsView: [UIView] {
        [redView, yellowView, greenView]
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        makeDarken(views: colorsView)
        makeRounded(views: colorsView)
        makeCornerRadius(to: actionButton, with: 20)
    }
    
    // MARK: Press Button
    @IBAction func turnTrafficLight() {
        
        colorCounter = colorCounter >= 3 ? 0 : colorCounter
        
        for (index, view) in colorsView.enumerated() {
            if index == colorCounter {
                view.alpha = 1.0
                actionButton.setTitle("NEXT", for: .normal)
            } else {
                view.alpha = 0.3
            }
        }
        colorCounter += 1
    }
}

// MARK: Extension
private extension ViewController {
    
    func makeDarken(views: [UIView]) {
        views.forEach { $0.alpha = 0.3 }
    }
    
    func makeRounded(views: [UIView]) {
        views.forEach { $0.layer.cornerRadius = 80}
    }
    
    func makeCornerRadius(to button: UIView, with radius: CGFloat) {
        button.layer.cornerRadius = radius
    }
}
