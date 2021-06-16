//
//  UnwindCustomPushSegue.swift
//  testSegue
//
//  Created by swamnx on 16.06.21.
//

import Foundation
import UIKit

class UnwindCustomPushSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let sourceView = self.source.view, let destinationView = self.destination.view else { return }
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(destinationView, aboveSubview: sourceView)
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        destinationView.frame = CGRect(x: 0.0, y: -screenHeight, width: screenWidth, height: screenHeight)
        let animations = {
            sourceView.frame = sourceView.frame.offsetBy(dx: 0.0, dy: screenHeight)
            destinationView.frame = destinationView.frame.offsetBy(dx: 0.0, dy: screenHeight)
        }
        let completion: (Bool) -> Void = { _ in
             self.source.dismiss(animated: false, completion: nil)
        }
        UIView.animate(withDuration: 2, animations: animations, completion: completion)
    }
}
