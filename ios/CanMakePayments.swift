import StoreKit

@objc(CanMakePayments)
class CanMakePayments: NSObject {
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }

    @objc public func canMakePayments(_ resolve:RCTPromiseResolveBlock, withRejecter reject:RCTPromiseRejectBlock) -> Void {
      resolve(SKPaymentQueue.canMakePayments())
    }

    @objc public func openExternalPurchaseLink(_ resolve:RCTPromiseResolveBlock, withRejecter reject:RCTPromiseRejectBlock) -> Void {
        if let url = URL(string: "https://athstat.io"), SKExternalPurchaseLink.canOpen(url) {
            SKExternalPurchaseLink.open(url) { result in
                switch result {
                case .success(let token):
                    resolve(token)
                case .failure(let error):
                    reject("Error", "Failed to open external purchase link", error)
                }
            }
        } else {
            reject("Error", "Invalid URL or cannot open external purchase link", nil)
        }
    }
}
