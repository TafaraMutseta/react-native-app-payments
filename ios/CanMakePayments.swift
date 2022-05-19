import StoreKit

@objc(CanMakePayments)
class CanMakePayments: NSObject {

    @objc public func canMakePayments(_ resolve:RCTPromiseResolveBlock, withRejecter reject:RCTPromiseRejectBlock) -> Void {
      resolve(SKPaymentQueue.canMakePayments())
    }
}
