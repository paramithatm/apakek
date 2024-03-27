//
//  BlingBangBangBorn.swift
//  apakek
//
//  Created by Paramitha on 19/03/24.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView?
    var initialTouchPoint: CGPoint = CGPoint.zero
    var touchStartTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressRecognizer.minimumPressDuration = 0  // Start immediately upon touch
        view.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        view.backgroundColor = .blue
    }

    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.view)

        switch gestureRecognizer.state {
        case .began:
            initialTouchPoint = touchPoint
            touchStartTime = Date()
            startImageAtPoint(touchPoint)
            continueScalingImage()  // Start scaling
        case .ended, .cancelled:
            touchStartTime = nil  // Reset the start time
        default:
            break
        }
    }

    func startImageAtPoint(_ point: CGPoint) {
        let image = UIImage(named: "test") // Replace "YourImageName" with your actual image name
        imageView = UIImageView(image: image)
        if let imageView = imageView {
            imageView.center = point
            imageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)  // Start small
            view.addSubview(imageView)
        }
    }

    func continueScalingImage() {
        guard let startTime = touchStartTime else { return }

        let currentTime = Date()
        let elapsedTime = currentTime.timeIntervalSince(startTime)

        // Update the scale based on the elapsed time, adjust these values as needed
        let scale = CGFloat(0.1 + elapsedTime)  // Starts at 0.1 and increases over time
        imageView?.transform = CGAffineTransform(scaleX: scale, y: scale)

        // Continue updating if the touch is still active
        if imageView != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
                self?.continueScalingImage()
            }
        }
    }
}

