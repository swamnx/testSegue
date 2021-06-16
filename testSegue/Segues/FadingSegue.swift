//
//  showSecondScreenSegue.swift
//  testSegue
//
//  Created by swamnx on 12.06.21.
//

import Foundation
import UIKit

class FadingSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let sourceView = self.source.view, let destinationView = self.destination.view else { return }
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(destinationView, aboveSubview: sourceView)
        sourceView.alpha = 1.0
        destinationView.alpha = 0.0
        let animations = {
            sourceView.alpha = 0.0
            destinationView.alpha = 1.0
        }
        let completion: (Bool) -> Void = { _ in
            self.source.present(self.destination, animated: false)
        }
        UIView.animate(withDuration: 2, animations: animations, completion: completion)
    }
}
