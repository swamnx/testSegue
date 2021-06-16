//
//  FadingSegue1.swift
//  testSegue
//
//  Created by swamnx on 16.06.21.
//

import Foundation
import UIKit

class UnwindFadingSegue: UIStoryboardSegue {
    
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
            self.source.dismiss(animated: false, completion: nil)
        }
        UIView.animate(withDuration: 2, animations: animations, completion: completion)
    }
}
