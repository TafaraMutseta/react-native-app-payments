import StoreKit

@objc(CanMakePayments)
class CanMakePayments: NSObject {
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }

    @objc public func canMakePayments(_ resolve:RCTPromiseResolveBlock, withRejecter reject:RCTPromiseRejectBlock) -> Void {
      resolve(SKPaymentQueue.canMakePayments())
    }
}
