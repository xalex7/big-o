import Foundation
import QuartzCore

public final class BenchTimer {
    @inline(__always) public static func measureBlock(executionCount: UInt = 10, closure: () -> Void) -> CFTimeInterval {
        
        var executionTime: Double = 0
        
        for _ in 0..<executionCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            executionTime += (endTime - startTime)
        }
        
        return executionTime / Double(executionCount)
    }
}
