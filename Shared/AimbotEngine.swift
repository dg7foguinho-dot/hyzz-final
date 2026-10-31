import UIKit
import Vision
import ReplayKit
import Foundation

class AimbotEngine {
    static let shared = AimbotEngine()
    var enabled = false
    var targetMode = 0 
    private var isProcessing = false
    
    func setup() {
        // Motor iniciado
    }
    
    func process(buffer: CMSampleBuffer) {
        guard enabled, !isProcessing else { return }
        isProcessing = true
        DispatchQueue.main.async {
            self.isProcessing = false
        }
    }
}
